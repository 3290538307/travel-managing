package com.etc.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;

public class MailExecute {
	private static ExecutorService service=Executors.newCachedThreadPool(); 
	public static void sendMail(String receiveMailAccount,String nickname,String url){
		Mail mail=new Mail();
		mail.setInfo(receiveMailAccount, nickname, url);
		service.execute(mail);
	}
	public static void upload(HttpServletRequest request){
		service.execute(new Upload(request));
	}
}
