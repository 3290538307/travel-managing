package com.etc.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.etc.utils.JedisPoolUtils;

import redis.clients.jedis.Jedis;

@ServerEndpoint("/message/{uid}")
public class MessageSocket {
	//静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static CopyOnWriteArraySet<MessageSocket> webSocketSet = new CopyOnWriteArraySet<MessageSocket>();
    private static Map<String, MessageSocket> socketMap=new HashMap<>(); //
    private static final Map<String, List<MessageSocket>> socketMap2=new HashMap<>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    private String uid;
    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session,@PathParam("uid") String uid){
        this.session = session;
        List<MessageSocket> list=null;
        if(!socketMap2.containsKey(uid)){
        	list=new ArrayList<>();
        	socketMap2.put(uid, list);
        }else{
        	list=socketMap2.get(uid);
        }
        list.add(this);
        /*if(!socketMap.containsKey(uid)){
        	socketMap.put(uid, this);
        }
        socketMap.put(uid, this);*/
        this.uid=uid;
        webSocketSet.add(this);     //加入set中
        addOnlineCount();           //在线数加1
        System.out.println("message有新连接加入！当前在线人数为" + getOnlineCount());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);  //从set中删除
        //socketMap.remove(uid);
        subOnlineCount();           //在线数减1
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    
    @OnMessage
    public void onMessage(String uid, Session session) {
    	//System.out.println("message"+uid);
    	Jedis jedis=JedisPoolUtils.getPool().getResource();
    	//System.out.println(uid);
    	long length=jedis.llen("user_msg:"+uid);
    	try {
    		/*if(socketMap.get(uid)!=null)
    			socketMap.get(uid).sendMessage(String.valueOf(length));*/
    		for(MessageSocket item:socketMap2.get(uid)){
    			if(item!=null){
    				item.sendMessage(String.valueOf(length));
    			}
    		}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    			//System.out.println("来自客户端的消息:" + message);
    	//群发消息
    	/*for(WebSocketDemo item: webSocketSet){
    		try {
    			item.sendMessage(String.valueOf(0));
    		} catch (IOException e) {
    			e.printStackTrace();
    			continue;
    		}
    	}*/
    	JedisPoolUtils.getPool().returnResource(jedis);
    }

    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException{
    	if(this.session.isOpen())
    		this.session.getBasicRemote().sendText(message);
    	//this.session.getBasicRemote().
        //this.session.getAsyncRemote().sendText(message);
    }

    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
    	MessageSocket.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
    	MessageSocket.onlineCount--;
    }
}
