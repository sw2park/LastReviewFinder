package com.reviewfinder.date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateController {
	// 오늘날짜 구해서 yyyyMMdd로 변환
	public String getToday() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date nowDate = new Date();
		String nowStr = format.format(nowDate);
		
		return nowStr;
	}
	
	// 저번달 1일 구해서 yyyyMMdd로 변환
	public String getLastMonth() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, -1); // 저번 달로 이동
		cal.set(Calendar.DAY_OF_MONTH,1); // 해당 월의 1일로 변경
		
		// Calendear을 Date로 변환
		Date lastMonthDate = cal.getTime();
		
		String lastMonth = format.format(lastMonthDate);
		
		return lastMonth;
	}
	
	// 저저번달 1일 구해서 yyyyMMdd로 변환
	public String getLastLastMonth() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, -2); // 저번 달로 이동
		cal.set(Calendar.DAY_OF_MONTH,1); // 해당 월의 1일로 변경
		
		// Calendear을 Date로 변환
		Date lastMonthDate = cal.getTime();
		
		String lastMonth = format.format(lastMonthDate);
		
		return lastMonth;
	}
}