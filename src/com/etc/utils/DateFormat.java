package com.etc.utils;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateFormat {
	public static Date strToDate(String date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		java.util.Date date2=null;
		try {
			date2=format.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new Date(date2.getTime());
	}

}
