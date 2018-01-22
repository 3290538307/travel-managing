package com.etc.utils;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class Upload implements Runnable{
	private static final String path="E:\\Web\\good\\WebContent\\client\\images\\";
	private HttpServletRequest request;
	public Upload(HttpServletRequest request) {
		// TODO Auto-generated constructor stub
		this.request=request;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());
		if(multipartResolver.isMultipart(request)){
			//将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
          //获取multiRequest 中所有的文件名
            Iterator<String> iterator=multiRequest.getFileNames();
            System.out.println("开始上传");
            while(iterator.hasNext()){
            	//一次遍历所有文件
            	MultipartFile file=multiRequest.getFile(iterator.next().toString());
            	if(file!=null){
            		
            		String path1=path+file.getOriginalFilename();
            		try {
						file.transferTo(new File(path1));
						
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
            	}
            }
		}
	}
}
