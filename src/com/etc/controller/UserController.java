package com.etc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;






import redis.clients.jedis.Jedis;
import redis.clients.jedis.Pipeline;

import com.etc.pojo.Admin;
import com.etc.pojo.Jby;
import com.etc.pojo.Memory;
import com.etc.pojo.Message;
import com.etc.pojo.Newstrategypojo;
import com.etc.pojo.Notice;
import com.etc.pojo.Reply;
import com.etc.pojo.SpotStrategyInfo;
import com.etc.pojo.UserInfo;
import com.etc.pojo.UserInfoDetail;
import com.etc.pojo.Zone;
import com.etc.service.AdminService;
import com.etc.service.JbyService;
import com.etc.service.MemoryService;
import com.etc.service.MessageService;
import com.etc.service.NewstrategyService;
import com.etc.service.NoticeService;
import com.etc.service.ReplyService;
import com.etc.service.SpotStrategyInfoService;
import com.etc.service.UserInfoService;
import com.etc.service.ZoneService;
import com.etc.service.MreplyService;
import com.etc.utils.Captcha;
import com.etc.utils.DateFormat;
import com.etc.utils.DeleteFile;
import com.etc.utils.JedisPoolUtils;
import com.etc.utils.MailExecute;
import com.etc.utils.Page;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/client")
public class UserController {
	@Autowired
	private UserInfoService userService=null;
	@Autowired 
	private NoticeService noticeService=null;
	@Autowired
	private MemoryService memoryService=null;
	@Autowired 
	private ZoneService zoneService=null;
	@Autowired
	private JbyService jbyService=null;
	@Autowired 
	private ReplyService replyService=null;
	@Autowired
	private MreplyService mreplyService=null;
	@Autowired
	private AdminService adminservice=null;
	@Autowired
	private NewstrategyService newstrategyService=null;
	@Autowired
	private MessageService messageService=null;
	@Autowired
	private SpotStrategyInfoService strategyService=null;

	@RequestMapping(value="/login/login",method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpSession session,HttpServletResponse response){

		UserInfo user=userService.getPojo(request.getParameter("nickname"));
		ModelAndView mv=new ModelAndView();
		String viewName="/login/login";
		if(user==null){
			request.setAttribute("msg", "该用户不存在!");
		}else if(!(user.getPassword()).equals(request.getParameter("password"))){
			request.setAttribute("msg", "密码错误");
		}else{
			session.setAttribute("name", user.getName());
			session.setAttribute("uid", user.getId());
			//viewName="index";
			try {
				response.sendRedirect("../index.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mv.setViewName(viewName);
		return mv;
	}
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/index");
		List<Notice> notices=noticeService.getNotice();
		mv.addObject("notices", notices);
		return mv;
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,HttpSession session){
		session.removeAttribute("name");
		return "redirect: index.do";
	}
	@RequestMapping("/checkname")
	public @ResponseBody String checkName(String nickname){
		UserInfo user=userService.getPojo(nickname);
		if(user==null){
			return "sucess";
		}
		return "";
	}
	@RequestMapping("/login/checkpwd")
	public @ResponseBody String checkPwd(String password,String repassword){
		if("".equals(password)||"".equals(repassword)){
			return "null";
		}
		if(password.equals(repassword)){
			return "sucess";
		}
		return "";
	}
	@RequestMapping("/checkemail")
	public @ResponseBody String checkemail(String email){
		if(userService.getPojo(email)!=null){
			return "existed";
		}
		String regex="^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		if(Pattern.matches(regex, email)){
			return "sucess";
		}
		return "";
	}
	@RequestMapping("/login/findpassword")
	public @ResponseBody String findpassword(String nickname,String email){
		UserInfo user=userService.getPojo(nickname);
		String msg=null;
		Jedis jedis=JedisPoolUtils.getPool().getResource();
		if(user==null){
			msg="fail1";
		}else if(!user.getEmail().equals(email)){
			msg="fail2";
		}else{
			msg="success";
			//閸欐垿鍋栨禒锟�
			String key=UUID.randomUUID().toString().replace("-", "");
			jedis.set("client:"+nickname, key);
			String url = "http://localhost:8080/good/client/login/resetpwd.jsp?key="+key+"&nickname="+nickname;
			MailExecute.sendMail(email, nickname, url);
		}
		JedisPoolUtils.getPool().returnResource(jedis);
		return msg;
	}
	@RequestMapping(value="/login/resetpwd",method=RequestMethod.POST)
	public @ResponseBody String resetPassword(String nickname,String key,String password){
		Jedis jedis=JedisPoolUtils.getPool().getResource();
		if(!"".equals(key)&&key.equals(jedis.get("client:"+nickname))){
			userService.updatePojo(nickname, password);
			jedis.del("client:"+nickname);
			JedisPoolUtils.getPool().returnResource(jedis);
			return "true";
		}
		JedisPoolUtils.getPool().returnResource(jedis);
		return "false";
	}
	@RequestMapping(value="/resetPasswd",method=RequestMethod.POST)
	public String resetPwd(@SessionAttribute("uid") int uid,String surepassword){
		userService.updatePwd(uid, surepassword);
		return "redirect: login/login.jsp";
	}
	@RequestMapping("/captcha")
	public void drawCaptcha(HttpServletRequest req,HttpServletResponse resp){
		Captcha captcha=new Captcha();
		// 鐏忓棛鏁撻幋鎰畱妤犲矁鐦夐惍涔de閺�鎯у弳sessoin娑擄拷
		req.getSession().setAttribute("code", captcha.getCaptcha());
		// 闁俺绻僆mageIO鐏忓棗娴橀悧鍥翻閸戯拷
		try {
			ImageIO.write(captcha.getBufferedImage(), "jpg", resp.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/checkcaptcha")
	public @ResponseBody String checkCaptcha(HttpServletRequest req,HttpSession session){
		String userCaptcha=req.getParameter("checkcode").toUpperCase();
		String answer=(String)session.getAttribute("code");
		if("".equals(userCaptcha)){
			return "null";
		}
		if(userCaptcha.equals(answer.toUpperCase())){
			return "true";
		}
		return "false";
	}
	@RequestMapping("/login/register")
	public void register(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("nickname");
		String password=request.getParameter("password");
		String repassword=request.getParameter("repassword");
		String email=request.getParameter("email");
		UserInfo user=userService.getPojo(name);
		ModelAndView mv=new ModelAndView();
		String viewName="/login/register";
		mv.setViewName(viewName);
		if("".equals(name)||"".equals(password)||"".equals(repassword)||"".equals(email)){
			request.setAttribute("msg", "信息不能为空");
		}
		if(user!=null){
			request.setAttribute("msg", "该用户名已存在!");
		}else{
			if(!password.equals(repassword)){
				request.setAttribute("msg", "涓ゆ杈撳叆鐨勫瘑鐮佷笉涓�鑷�");
			}else {
				String regex="^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
				if(!Pattern.matches(regex, email)){
					request.setAttribute("msg", "閭鏍煎紡閿欒");
				}else{
					user=new UserInfo();
					user.setName(name);
					user.setPassword(password);
					user.setEmail(email);
					userService.insertPojo(user);
					response.sendRedirect("login.jsp");
				}
			}
		}
		request.getRequestDispatcher("register.jsp").forward(request, response);
		//response.sendRedirect("login/register.jsp");
	}
	@RequestMapping("/memory/memory")
	public ModelAndView getMemoryByKind(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/memory/memory");
		mv.addObject("memory1", memoryService.getByKind(1));
		mv.addObject("memory2", memoryService.getByKind(2));
		mv.addObject("memory3", memoryService.getByKind(3));
		mv.addObject("memory4", memoryService.getByKind(4));
		return mv;
	}
	@RequestMapping("/memory/memory_detail")
	public ModelAndView getMemoryDetailById(String id,String p){
		Page page=new Page(6);
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		int count=mreplyService.countBylyjy_id(Integer.valueOf(id));
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();

		ModelAndView mv=new ModelAndView();
		mv.setViewName("/memory/memory_detail");
		mv.addObject("memDetail", memoryService.getDetailById(Integer.valueOf(id)));
		mv.addObject("length", pageIndex.length);
		mv.addObject("currentPage", currentPage);
		if(pageIndex.length>0){
			mv.addObject("mreply", mreplyService.getBylyjy_id(pageIndex[currentPage-1], page.getPerNum(), Integer.valueOf(id)));
		}else{
			mv.addObject("mreply", null);
		}

		return mv;
	}
	@RequestMapping(value="/memory/mreply_insert",method=RequestMethod.POST)//
	public String insertMreply(@SessionAttribute("uid")int uid,String content,String lyjy_id) throws ServletException,IOException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		int id=Integer.valueOf(lyjy_id);
		mreplyService.insertMreply(id, uid, content, time);
		return "redirect: memory_detail.do?id="+id;
	}
	@RequestMapping("/memory/memory_list")
	public ModelAndView getMemoryList(String kind,String page){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/memory/memory_list");
		int count=0,pageIndex=1;
		if(kind==null){
			count=memoryService.getCountByKind(1);

		}else{
			count=memoryService.getCountByKind(Integer.valueOf(kind));
		}
		if(page!=null){
			pageIndex=Integer.valueOf(page);
		}
		Page page1=new Page(3);
		page1.setTotal(count);
		int[] pageIndex1=page1.getPerPageStartIndex();
		//System.out.println(pageIndex);
		//System.out.println(pageIndex1[pageIndex-1]);
		if(kind==null){
			mv.addObject("kind", null);
			mv.addObject("memory", memoryService.getByIndex(pageIndex1[pageIndex-1], 3, 1));
			//System.out.println( memoryService.getByIndex(pageIndex1[pageIndex-1], 3, 1).size());
		}else{
			mv.addObject("kind", Integer.valueOf(kind));
			mv.addObject("memory", memoryService.getByIndex(pageIndex1[pageIndex-1], 3, Integer.valueOf(kind)));
		}
		mv.addObject("length", pageIndex1.length);
		mv.addObject("currentPage", pageIndex);
		return mv;
	}
	@RequestMapping("/user/state")
	public ModelAndView getUserZone(HttpSession session,HttpServletRequest request){
		Page page=new Page(6);
		int uid=(int)session.getAttribute("uid");
		Integer count=zoneService.getMyZoneCount(uid);
		String page1=request.getParameter("p");
		int start=1;
		if(page1!=null){
			start=Integer.valueOf(page1);
		}
		if(count!=null)
			page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/state");
		if(pageIndex.length>0){
			mv.addObject("myZones", zoneService.getZoneByUid(uid, pageIndex[start-1], page.getPerNum()));
		}else{
			mv.addObject("myZones", null);
		}
		mv.addObject("length", pageIndex.length);
		mv.addObject("currentPage", (page1==null?1:Integer.valueOf(page1)));
		return mv;
	}
	@RequestMapping("/user/zone_delete")
	public String deleteZone(String id) throws ServletException, IOException{
		replyService.deleteReply(Integer.valueOf(id));
		zoneService.deleteMyZoneById(Integer.valueOf(id));
		return "redirect: state.do";
		//request.getRequestDispatcher("/client/user/state.do").forward(request, response);
	}
	@RequestMapping(value="/user/zone_insert",method=RequestMethod.POST)
	public void insertZone(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String content=request.getParameter("content");
		System.out.println(request.getParameter("content"));
		int uid=(int) request.getSession().getAttribute("uid");
		Timestamp stamp=new Timestamp(System.currentTimeMillis());
		zoneService.insertZone(uid, stamp, content);
		request.getRequestDispatcher("/client/user/state.do").forward(request, response);
	}
	@RequestMapping(value="/user/memory_add",method=RequestMethod.POST)
	public void insertMemory(String kind, String title, String content,  MultipartFile photo, HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		System.out.println(121);
		String photoName=photo.getOriginalFilename();
		Date date=new Date(System.currentTimeMillis());
		Memory memory=new Memory();
		memory.setCdate(date);
		memory.setContent(request.getParameter("content"));
		System.out.println(request.getParameter("content"));
		memory.setKind(Integer.valueOf(kind));
		memory.setUid((int)request.getSession().getAttribute("uid"));
		memory.setPath1(photoName);
		memory.setTitle(title);
		memoryService.insertMemory(memory);
		MailExecute.upload(request);//瀵倹顒炴稉濠佺炊閻撗呭
		//鐠哄疇娴�
		response.sendRedirect("memeroy_list.do");
	}
	@RequestMapping("/user/memeroy_list")
	public ModelAndView getMyMemoryList(String p,HttpSession session){
		Page page=new Page(4);
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.parseInt(p);
		}
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/memeroy_list");
		int uid=(int)session.getAttribute("uid");
		int count=memoryService.getCountByUid(uid);
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		mv.addObject("currentPage", currentPage);
		mv.addObject("length", pageIndex.length);
		mv.addObject("myMemory", memoryService.getByUid(pageIndex[currentPage-1], page.getPerNum(), uid));
		//mv.addObject("myMemory", memoryService.getByUid(uid));
		return mv;
	}
	@RequestMapping("/user/memory_delete")
	public String deleteMemory(String id,HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		memoryService.deleteById(Integer.valueOf(id));
		return "redirect: memeroy_list.do";
	}

	@RequestMapping(value="/user/travel_add",method=RequestMethod.POST)
	public String insertTravel(String title,String start,String end,String dest,String phone,String content,HttpSession session){
		Jby jby=new Jby();
		jby.setCdate(new Date(System.currentTimeMillis()));
		jby.setContent(content);
		jby.setDest(dest);
		jby.setFromdate(DateFormat.strToDate(start));
		jby.setState(1);
		jby.setTitle(title);
		jby.setTodate(DateFormat.strToDate(end));
		jby.setUid((int)session.getAttribute("uid"));
		jbyService.insertJby(jby);
		//鏉烆剙褰�
		return "redirect: travel_list.do";
	}
	@RequestMapping("/strategy/strategy")
	public void travel(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		List<SpotStrategyInfo> strategy=strategyService.getALL();
		request.setAttribute("newstrategy", strategy);
		try {
			request.getRequestDispatcher("strategy.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
	@RequestMapping("/strategy/strategy_detail")
	public void travelDetail(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		SpotStrategyInfo detail=strategyService.getStrategyDetailById(request.getParameter("id"));
		//System.out.println(detail.getId());

		request.setAttribute("travel_detail", detail);
		try {
			request.getRequestDispatcher("strategy_detail.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	@RequestMapping("/user/travel_list")
	public ModelAndView getMyTravelList(@SessionAttribute("uid") int uid,String p){
		ModelAndView mv=new ModelAndView();
		Page page=new Page(6);
		int count=jbyService.JbyCountByUid(uid);
		page.setTotal(count);
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		int[] pageIndex=page.getPerPageStartIndex();
		mv.setViewName("/user/travel_list");
		if(pageIndex.length>0)
			mv.addObject("myTravel", jbyService.getByUid(pageIndex[currentPage-1], page.getPerNum(), uid));
		else{
			mv.addObject("myTravel", null);
		}
		mv.addObject("length", pageIndex.length);
		mv.addObject("currentPage", currentPage);
		return mv;
	}
	@RequestMapping("/user/travel_delete")
	public String deleteATravel(String id){
		jbyService.deleteById(Integer.valueOf(id));

		return "redirect: travel_list.do";
	}
	@RequestMapping("/user/acccount_detail")
	public ModelAndView checkMyInfo(@SessionAttribute("uid") int uid){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/acccount_detail");
		mv.addObject("user", userService.getUserDetailById(String.valueOf(uid)));
		return mv;
	}
	@RequestMapping(value="/user/account_revise",method=RequestMethod.POST)
	public String updateUser(@SessionAttribute("uid") int uid,String optionsRadios,String birthday,String address,String qq,String phone,String hobby,String content){
		int sex=optionsRadios.equals("男")?1:0;
		Date bDate=DateFormat.strToDate(birthday);
		UserInfoDetail detail=new UserInfoDetail();
		detail.setAddress(address);
		detail.setBirthday(bDate);
		detail.setHobby(hobby);
		detail.setIntroduce(content);
		detail.setPhone(phone);
		detail.setQq(qq);
		detail.setSex(sex);
		detail.setId(uid);
		userService.updateUser(detail);
		return "redirect: acccount_detail.do";
	}
	@RequestMapping("/user/img_change")
	public ModelAndView getImg(@SessionAttribute("uid") int uid){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/img_change");
		mv.addObject("img_name", userService.getImg(uid));
		return mv;
	}
	@RequestMapping(value="/user/photo_update",method=RequestMethod.POST)
	public String updateImg(@SessionAttribute("uid") int uid,MultipartFile newPhoto,HttpServletRequest req){
		System.out.println(newPhoto.getOriginalFilename());
		DeleteFile.deleteFile(newPhoto.getOriginalFilename());
		MailExecute.upload(req);
		userService.updateImg(uid, newPhoto.getOriginalFilename());
		return "redirect: img_change.do";
	}
	@RequestMapping(value="/user/check_oldpassword",method=RequestMethod.POST)
	public @ResponseBody String checkOldPasswd(@SessionAttribute("uid") int uid,String oldpassword){
		UserInfoDetail detail=userService.getUserDetailById(String.valueOf(uid));
		if(!detail.getPassword().equals(oldpassword)){
			return "fail";
		}
		return "";
	}
	@RequestMapping("/user/friend")
	public ModelAndView showFriends(@SessionAttribute("uid") int uid,String p){
		Page page=new Page(4);
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/friend");
		int count=userService.countFriends(uid);
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		List<UserInfoDetail> friends=userService.getFriends(pageIndex[currentPage-1],page.getPerNum(),uid);
		mv.addObject("length", pageIndex.length);
		mv.addObject("currentPage", currentPage);
		mv.addObject("myFriends", friends);
		return mv;
	}
	@RequestMapping("/user/delete_friend")
	public String deleteFriend(@SessionAttribute("uid") int uid,String fid){
		userService.deleteFriend(uid, Integer.valueOf(fid));
		return "redirect: friend.do";
	}
	@RequestMapping("/user/state_friend")
	public ModelAndView getStateFriend(@SessionAttribute("uid") int uid,String p){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/state_friend");
		Page page=new Page(4);
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		int count=zoneService.countFriendZones(uid);
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		mv.addObject("length", pageIndex.length);
		mv.addObject("currentPage", currentPage);
		mv.addObject("friendsZone", zoneService.getFriendZones(uid, pageIndex[currentPage-1], page.getPerNum()));
		return mv;
	}
	@RequestMapping(value="/user/state_comment",produces="text/html; charset=utf-8")  //id娑撶皵one_id
	public ModelAndView stateComment(@SessionAttribute("uid") int uid,String id,String p){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/state_comment");
		Zone zone=zoneService.getZoneById(Integer.valueOf(id));
		mv.addObject("zone", zone);
		mv.addObject("myImage", userService.getImg(uid));
		Page page=new Page(4);
		int count=replyService.countByZoneId(Integer.valueOf(id));
		page.setTotal(count);
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		int[] pageIndex=page.getPerPageStartIndex();
		mv.addObject("length", pageIndex.length);
		mv.addObject("currentPage", currentPage);
		if(pageIndex.length>0){
			mv.addObject("replys", replyService.getByZoneId(pageIndex[currentPage-1], page.getPerNum(), Integer.valueOf(id)));
		}
		else{
			mv.addObject("replys", null);
		}
		return mv;
	}
	@RequestMapping(value="/user/insert_reply",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	public String insertReply(@SessionAttribute("uid") int uid,String zoneId,String mycontent){
		Reply reply=new Reply();
		reply.setReply(mycontent);
		reply.setTime(new Timestamp(System.currentTimeMillis()));
		reply.setUid(uid);
		reply.setZone_id(Integer.valueOf(zoneId));
		replyService.insertReply(reply);
		return "redirect: state_comment.do?id="+zoneId;
	}
	@RequestMapping("/friend/user_basic")
	public ModelAndView showUser(String id,@SessionAttribute("uid") int uid){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/friend/user_basic");
		mv.addObject("user", userService.getUserDetailById(id));
		mv.addObject("is_friend", userService.isFriend(uid, Integer.valueOf(id)));
		mv.addObject("isSend", userService.isSend(uid, Integer.valueOf(id)));
		//System.out.println(uid+"  "+id);
		//System.out.println(userService.isSend(uid, Integer.valueOf(id)));
		return mv;
	}
	@RequestMapping("/friend/user_memory")
	public ModelAndView getUserMemory(String id,String p){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/friend/user_memory");
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		Page page=new Page(5);
		int count=memoryService.getCountByUid(Integer.valueOf(id));
		//System.out.println(count);
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		if(pageIndex.length>0)
			mv.addObject("memory", memoryService.getByUid(pageIndex[currentPage-1], page.getPerNum(), Integer.valueOf(id)));
		else{
			mv.addObject("memory", null);
		}
		//System.out.println(memoryService.getByUid(pageIndex[currentPage-1], page.getPerNum(), Integer.valueOf(userId)).size());
		mv.addObject("currentPage", currentPage);
		mv.addObject("length", pageIndex.length);
		mv.addObject("userId",id);
		return mv;
	}
	@RequestMapping("/traveller/traveller_detail")
	public ModelAndView getTravelDetailByid(String id){
		ModelAndView mv=new ModelAndView();
		String viewName="/traveller/traveller_detail";
		mv.setViewName(viewName);
		Jby jby2 =jbyService.getTravelDetailById(Integer.valueOf(id));
		mv.addObject("JbyId",jby2);
		return mv;
	}
	@RequestMapping("/traveller/traveller")
	public ModelAndView gettravellerAll(String p){
		ModelAndView mv=new ModelAndView();
		String viewName="/traveller/traveller";
		mv.setViewName(viewName);
		Page page=new Page(5);
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		int count=jbyService.countTravelALL();
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		List<Jby> jby1 =jbyService.getTravel(pageIndex[currentPage-1],page.getPerNum());
		mv.addObject("Jbylist",jby1);
		mv.addObject("currentPage", currentPage);
		mv.addObject("length", pageIndex.length);
		return mv;
	}


	@RequestMapping("/traveller/traveller_search")
	public ModelAndView gettravellerBydest(String dest){
		ModelAndView mv=new ModelAndView();
		String viewName="/traveller/traveller_search";
		mv.setViewName(viewName);
		List<Jby> jby6 =jbyService.getTravelDetailBydest(dest);
		mv.addObject("jbydest",jby6);
		return mv;
	}

	@RequestMapping("/user/other_member")
	public ModelAndView getOthers(@SessionAttribute("uid") int uid,String p){
		Page page=new Page(4);
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/user/other_member");
		int count=userService.countFriends(uid);
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		mv.addObject("length", pageIndex.length);
		mv.addObject("currentPage", currentPage);
		if(pageIndex.length>0)
			mv.addObject("myFriends", userService.getOthers(pageIndex[currentPage-1],page.getPerNum(),uid));
		else
			mv.addObject("myFriends", null);
		return mv;
	}

	@RequestMapping("/admin/logout")
	public String logoutAdmin(HttpSession session){
		session.removeAttribute("id");
		session.removeAttribute("adminname");
		return "redirect: login.jsp";
	}

	@RequestMapping(value="/admin/travel_delete.do", produces="text/html;charset=UTF-8")
	@ResponseBody
	public String deleteMemory(HttpServletRequest request,HttpServletResponse response) throws JsonProcessingException{		
		String id = request.getParameter("id");	
		memoryService.deleteMemory(Integer.valueOf(id));
		memoryService.deleteById(Integer.valueOf(id));
		List<Memory> memorylist = memoryService.getAll();
		ObjectMapper map = new ObjectMapper();
		String jsonlist = map.writeValueAsString(memorylist);

		return jsonlist;
	}



	@RequestMapping("/notice/notice")
	public void getNoticeDetailById(HttpServletRequest request,HttpServletResponse response){

		Notice notice = new Notice();
		notice = noticeService.getANotice(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("noticeDetail", notice);
		try {
			request.getRequestDispatcher("/client/notice/notice_detail.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	@RequestMapping("/admin/auser_list")
	public ModelAndView findAllUser(){
		System.out.println("auser");
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/admin/auser_list");
		Jedis jedis=JedisPoolUtils.getPool().getResource();
		jedis=new Jedis("localhost");
		List<UserInfo> users=null;
		if(jedis.exists("user_list:")){
			List<String> ids=jedis.lrange("user_list:", 0, -1);
			users=getAllByRedis(jedis, ids);
		}else{
			users=userService.getALL();///mysql
			addToRedis(jedis, users);
		}
		mv.addObject("users", users);
		mv.addObject("adminlist", adminservice.getAdminAll());
		JedisPoolUtils.getPool().returnResource(jedis);
		return mv;
	}
	@RequestMapping("/admin/auser_detail")
	public ModelAndView auserDetail(String id){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/admin/auser_detail");
		UserInfoDetail userDetail=userService.getUserDetailById(id);
		mv.addObject("userDetail", userDetail);

		return mv;
	}
	public List<UserInfo> getAllByRedis(Jedis jedis,List<String> ids){
		List<UserInfo> users=new LinkedList<>();
		UserInfo user=null;
		Map<String, String> maps=null;
		for(String id:ids){
			user=new UserInfo();
			maps=jedis.hgetAll("user_list:"+id);
			user.setId(Integer.valueOf(id));
			user.setName(maps.get("name:"));
			user.setEmail(maps.get("email:"));
			user.setSex(Integer.valueOf(maps.get("sex:")));
			user.setState(Integer.valueOf(maps.get("state:")));
			users.add(user);
		}
		return users;
	}
	public void addToRedis(Jedis jedis,List<UserInfo> users){
		Pipeline pipeline=jedis.pipelined();
		Map<String, String> map=null;
		for(UserInfo user:users){
			map=new HashMap<>();
			pipeline.lpush("user_list:", String.valueOf(user.getId()));
			map.put("name:", user.getName());
			map.put("email:", user.getEmail());
			map.put("sex:", String.valueOf(user.getSex()));
			map.put("state:", String.valueOf(user.getState()));
			pipeline.hmset("user_list:"+String.valueOf(user.getId()), map);
		}
		pipeline.sync();
	}
	@RequestMapping("/admin/pt_list")
	public ModelAndView getJbyAdmin(){
		System.out.println(12121);
		ModelAndView mv=new ModelAndView();
		String viewName="/admin/pt_list";
		mv.setViewName(viewName);
		List<Jby> jby3=jbyService.getTravelALL();
		mv.addObject("JbyPtlist",jby3);
		return mv;
	}
	@RequestMapping("/admin/inform_add")
	public String  addNotice(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		String title=  request.getParameter("texttitle");
		String message=request.getParameter("textmessage");

		Notice notice=new Notice();
		notice.setMessage(message);
		notice.setTitle(title);
		notice.setCdate(new Date(System.currentTimeMillis()));
		notice.setAid((int)request.getSession().getAttribute("id"));
		noticeService.insertPojo(notice);
		return "redirect: inform_list.do";
		/*List<Notice> notices=noticeService.getAdminNotice();

		request.setAttribute("newnotice", notices);

		try {
			request.getRequestDispatcher("inform_list.jsp").forward(request, response);
			System.out.println(notices.size());
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	@RequestMapping("/admin/pt_detail")
	public ModelAndView getTravelAdminByid(String id,String p){
		ModelAndView mv=new ModelAndView();
		String viewName="/admin/pt_detail";
		mv.setViewName(viewName);
		Jby jby4 =jbyService.getTravelDetailById(Integer.valueOf(id));
		mv.addObject("AdminJbyId",jby4);
		return mv;
	}

	@RequestMapping(value="/admin/pt_delete.do", produces="appliction/json;charset=UTF-8")
	@ResponseBody
	public String deleteJby(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String id=request.getParameter("id");
		jbyService.deleteById(Integer.valueOf(id));
		List<Jby> jby5 = jbyService.getTravelALL();

		ObjectMapper mapper = new ObjectMapper();


		String jsonlist = mapper.writeValueAsString(jby5);
		System.out.println(jsonlist);
		return jsonlist;
	}

	@RequestMapping("/friend/user_partner")
	public ModelAndView getPartner(String id,String p){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/friend/user_partner");
		Page page=new Page(3);
		int count=jbyService.JbyCountByUid(Integer.valueOf(id));
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		if(pageIndex.length>0){
			mv.addObject("Jbylist", jbyService.getByUid(pageIndex[currentPage-1], page.getPerNum(), Integer.valueOf(id)));
		}else{
			mv.addObject("Jbylist", null);
		}
		mv.addObject("length", pageIndex.length);
		mv.addObject("currentPage", currentPage);
		mv.addObject("u_id", id);
		return mv;
	}


	@RequestMapping("/traveller/check")
	public void  CheckDest(HttpServletRequest request,HttpServletResponse response){
		String dest = request.getParameter("dest");
		List<Jby> jby6 =jbyService.getTravelDetailBydest(dest);
		try {
			PrintWriter pw =response.getWriter();

			if(jby6.size()!=0){
				pw.write("success");
			}else{
				pw.write("fail");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 检查新管理员的用户与密码
	@RequestMapping("/admin/checkadminname")  //类似于.do文件 
	public void CheckAdminName(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");	
		Admin admin = adminservice.getAdmin(name);
		System.out.println(name);
		try {
			PrintWriter pw = response.getWriter();

			if(admin!=null){
				pw.write("fail");
			}else{
				pw.write("success");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/admin/checkadminpwd")  //类似于.do文件 
	public void CheckAdminPwd(HttpServletRequest request,HttpServletResponse response){
		String password = request.getParameter("password");	
		String repassword = request.getParameter("repassword");	
		try {
			PrintWriter pw = response.getWriter();

			if(!password.equals(repassword)){
				pw.write("fail");
			}else{
				pw.write("success");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	// 添加管理员及获取管理员表所有管理员信息
	@RequestMapping("/admin/Addadmin")  //类似于.do文件 
	public String AddAdmin(HttpServletRequest request,HttpServletResponse response){
		
		String name = request.getParameter("user");	
		String password = request.getParameter("repassword");	
		Admin admin = new Admin();
		admin.setName(name);
		admin.setPassword(password);
		adminservice.AddAdmin(admin);
		
		return "redirect: auser_list.do";
	}

	// 查找管理员用户名是否存在
	@RequestMapping("/admin/Findadminname")  //类似于.do文件 
	public void FindAdminName(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");	
		Admin admin = adminservice.getAdmin(name);
		try {
			PrintWriter pw = response.getWriter();

			if(admin!=null){
				pw.write("success");
			}else{
				pw.write("fail");

			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 检测管理员用户密码是否正确
	@RequestMapping("/admin/Findadminpwd")  //类似于.do文件 
	public void FindAdminPwd(HttpServletRequest request,HttpServletResponse response){
		String name=" ";
		String pass="";
		name = request.getParameter("name");	
		pass = request.getParameter("password");	
		Admin admin = adminservice.getAdmin(name);
		//System.out.println(admin.getName());
		try {
			PrintWriter pw = response.getWriter();

			if(admin!=null&&!admin.getPassword().equals(pass)){
				pw.write("fail");
			}else{
				pw.write("success");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 



	// 管理员用户登录
	@RequestMapping("/admin/admin_add")  //类似于.do文件 
	public void AdminLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException{
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		Admin admin = adminservice.getAdmin(name);
		if(admin==null){
			request.setAttribute("arg0", "用户不存在！");
			try {
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(admin!=null&&!admin.getPassword().equals(pass)){
			request.setAttribute("arg0", "用户名与密码不一致！");
			try {
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 登录成功
			session.setAttribute("id", admin.getId());
			session.setAttribute("adminname", admin.getName());
			if(request.getParameter("check")!=null){
				Cookie cookie1 = new Cookie("name",name);
				//cookie1.setMaxAge(0);
				Cookie cookie2 = new Cookie("pass",pass);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}else{
				Cookie[] cookies = request.getCookies();
				if(cookies != null && cookies.length > 0){  
					for(int i=0; i< cookies.length; i++){  
						if(cookies[i].getName().equals("name")){ 
							System.out.println(cookies[i].getValue());
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}  
						if(cookies[i].getName().equals("pass")){ 
							System.out.println(cookies[i].getValue());
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}  
					}     
				}  
			}
			
			request.getRequestDispatcher("admin_add.jsp").forward(request, response);		
	}
	@RequestMapping("/admin/strategy_list")
	public ModelAndView getNewlist(){

		ModelAndView mv=new ModelAndView();
		mv.setViewName("/admin/strategy_list");
		mv.addObject("newlist", newstrategyService.getStratelist());
		return mv;
	}
	@RequestMapping("/admin/strategy_add")
	public void insertNews(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		int uid= (int) request.getSession().getAttribute("id");
		String title= request.getParameter("title");
		String triptime= request.getParameter("triptime");
		String people= request.getParameter("people");
		String imgpath= request.getParameter("imgpath");
		String triptype= request.getParameter("triptype");
		String content= request.getParameter("content");
		String equipment= request.getParameter("equipment");
		String notice= request.getParameter("notice");
		String summary= request.getParameter("summary");
		String spot= request.getParameter("spot");
		Timestamp cdate=new Timestamp(System.currentTimeMillis());
		newstrategyService.insertNews(uid, title, triptime, people, imgpath, triptype, content, equipment, notice, summary, spot, cdate);
		request.getRequestDispatcher("/client/admin/strategy_list.do").forward(request, response);
	}
	@RequestMapping("/admin/deleteNews")
	public void deleteNews(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		int id=Integer.valueOf(request.getParameter("id"));
		newstrategyService.deleteNews(id);
		request.getRequestDispatcher("/client/admin/strategy_list.do").forward(request, response);

	}
	@RequestMapping("/admin/editNews")
	public void Change(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{

		int id=Integer.valueOf(request.getParameter("id"));
		Newstrategypojo line=newstrategyService.getline(id);
		request.setAttribute("edi", line);
		System.out.println(line);
		request.getRequestDispatcher("/client/admin/strategy_edit.jsp").forward(request, response);
	}
	@RequestMapping("/admin/strategy_edit") 
	public void edit(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		Newstrategypojo pojo=new Newstrategypojo();
		pojo.setTitle(request.getParameter("title"));
		pojo.setSpot(request.getParameter("spot"));
		pojo.setTriptime(request.getParameter("triptime"));
		pojo.setPeople(request.getParameter("people"));
		pojo.setImgpath(request.getParameter("imgpath"));
		pojo.setTriptype(request.getParameter("triptype"));
		pojo.setContent(request.getParameter("content"));
		pojo.setEquipment(request.getParameter("equipment"));
		pojo.setNotice(request.getParameter("notice"));
		pojo.setSummary(request.getParameter("summary"));
		pojo.setId(Integer.valueOf(request.getParameter("edit_idd")));
		newstrategyService.updatenews(pojo);
		request.getRequestDispatcher("/client/admin/strategy_list.do").forward(request, response);
	}
	
	// 旅游记忆列表
	@RequestMapping("/admin/travel_list") 
	public void getLyjy(HttpServletRequest request,HttpServletResponse response){		
		List<Memory> memorylist = memoryService.getAll();
		request.setAttribute("memorys", memorylist);
		try{
			request.getRequestDispatcher("../admin/travel_list.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	@RequestMapping("/friend/apply_friend")
	public @ResponseBody String applyFriend(@SessionAttribute("uid") int uid,String id){

		userService.applyFriend(uid, Integer.valueOf(id),new Timestamp(System.currentTimeMillis())); //添加到数据库
		Jedis jedis=JedisPoolUtils.getPool().getResource();
		jedis.lpush("user_id:"+id, String.valueOf(uid));
		JedisPoolUtils.getPool().returnResource(jedis);
		return "true";
	}
	@RequestMapping("/notice/apply")
	public ModelAndView getApply(@SessionAttribute("uid") int uid,String p){
		//Jedis jedis=JedisPoolUtils.getPool().getResource();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/notice/apply");
		Page page=new Page(4);
		int count=userService.countApplyFriends(uid);
		page.setTotal(count);
		int[] pageIndex=page.getPerPageStartIndex();
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		mv.addObject("currentPage", currentPage);
		mv.addObject("length", pageIndex.length);
		if(pageIndex.length>0)
			mv.addObject("applyFriends", userService.getApplyFriends(pageIndex[currentPage-1], page.getPerNum(), uid));
		else{
			mv.addObject("applyFriends", null);
		}
		return mv;
	}
	//agree
	@RequestMapping("/notice/agree")
	public String doAgree(String id,@SessionAttribute("uid")int uid){
		Jedis jedis=JedisPoolUtils.getPool().getResource();
		jedis.lrem("user_id:"+uid, 0, id);
		userService.updateFriend(uid, Integer.valueOf(id));
		return "redirect: apply.do";
	}
	@RequestMapping("/notice/refuse")
	public String doRefuse(String id,@SessionAttribute("uid")int uid){
		Jedis jedis=JedisPoolUtils.getPool().getResource();
		jedis.lrem("user_id:"+uid, 0, id);
		userService.deleteFriend(uid, Integer.valueOf(id));
		return "redirect: apply.do";
	}
	//message
	@RequestMapping("/notice/message")
	public ModelAndView getMessage(@SessionAttribute("uid") int uid,String p){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/notice/message");
		Page page=new Page(4);
		page.setTotal(messageService.countMessage(uid));
		int[] pageIndex=page.getPerPageStartIndex();
		int currentPage=1;
		if(p!=null){
			currentPage=Integer.valueOf(p);
		}
		mv.addObject("currentPage", currentPage);
		mv.addObject("length", pageIndex.length);
		if(pageIndex.length>0)
			mv.addObject("messages", messageService.getMessages(pageIndex[currentPage-1], page.getPerNum(), uid));
		else{
			mv.addObject("messages", null);
		}
		return mv;
	}
	@RequestMapping("/notice/send_message")
	public @ResponseBody String sendMessage(@SessionAttribute("uid") int uid,String toUser,String content){
		if(userService.getPojo(toUser)==null){
			return "fail";
		}
		Message message=new Message();
		message.setContent(content);
		message.setFrom_id(uid);
		message.setTo_id(userService.getPojo(toUser).getId());
		message.setTime(new Timestamp(System.currentTimeMillis()));
		messageService.insertMessage(message);
		Jedis jedis=JedisPoolUtils.getPool().getResource();
		jedis.lpush("user_msg:"+message.getTo_id(), String.valueOf(uid));
		JedisPoolUtils.getPool().returnResource(jedis);
		return "success";
	}
	@RequestMapping("/notice/delete_msg")
	public String deleteMsg(String id,@SessionAttribute("uid") int uid,String fromId){
		messageService.deleteMessage(Integer.valueOf(id));
		Jedis jedis=JedisPoolUtils.getPool().getResource();
		jedis.lrem("user_msg:"+uid, 1, fromId);
		JedisPoolUtils.getPool().returnResource(jedis);
		return "redirect: message.do";
	}
	
	@RequestMapping("/admin/travel_detail") 
	public void getLyjyById(HttpServletRequest request,HttpServletResponse response){		
		String id = request.getParameter("id");
		Memory memory = memoryService.getLyjyById(Integer.valueOf(id));
		request.setAttribute("memory", memory);
		try{
			request.getRequestDispatcher("../admin/travel_detail.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping("/admin/inform_list")
	public void noticeList(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		List<Notice> lists=noticeService.getAdminNotice();

		request.setAttribute("noticelist", lists);
		System.out.println(lists.size());
		try {
			request.getRequestDispatcher("inform_list.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//inform_edit
	@RequestMapping("/admin/inform_edit")
	public ModelAndView editInform(String id){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/admin/inform_edit");
		mv.addObject("notice", noticeService.getANotice(Integer.valueOf(id)));
		return mv;
	}
	@RequestMapping(value="/admin/update_notice",method=RequestMethod.POST)
	public String updateNotice(String id,String title,String message){
		noticeService.updateNotice(Integer.valueOf(id), title, message);
		return "redirect: inform_edit.do?id="+id;
	}
	@RequestMapping("/admin/inform_delete")
	public String deleteNotice(String id){
		noticeService.deleteNotice(Integer.valueOf(id));
		return "redirect: inform_list.do";
	}

}
