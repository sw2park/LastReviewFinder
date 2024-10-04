package com.reviewfinder.date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateController {
	// 반복문 용 통합
	public String getDay(int i) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd");
		
		Date date = new Date();
		String strDate = dateFormat.format(date);
		int nowDate = Integer.parseInt(strDate);
		
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, i);
		cal.set(Calendar.DAY_OF_MONTH, nowDate-1); // 해당 월의 어제 날짜로 변경
		
		// Calendear을 Date로 변환
		Date nowDay = cal.getTime();
		
		String day = format.format(nowDay);
		
		return day; 
	}
}