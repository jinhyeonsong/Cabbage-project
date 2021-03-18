package com.summer.cabbage.util;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class chartUtil {

	public static List<String> getDateList() {
		// 차트에 출력하기위해서 오늘로부터 총 11일전까지 총 12일간의 날짜가 필요하다 -> mmyy 의 형태로 리스트에 담아줌
		List<String> dateList = new ArrayList<String>();

		// 현재날짜를 기본으로 하는 calendar객체 얻어온다.
		Calendar cal = Calendar.getInstance();
		// 3월4일이면 0304 같은 형태로 받아올것
		DecimalFormat df = new DecimalFormat("00");

		// for 문을 돌려서 현재날짜부터 -11일 부터 0일

		for (int i = 0; i < 12; i++) {
			if (i == 0) {

			} else {

				cal.add(cal.DATE, -1);
			}

			// 날짜와 달을 받아서 dateList에 추가
			String dateStr = df.format(cal.get(Calendar.DATE));
			String monthStr = df.format(cal.get(Calendar.MONTH) + 1);
			String yearStr = df.format(cal.get(Calendar.YEAR));
			String fullDateStr = yearStr + monthStr + dateStr;

			dateList.add(0, fullDateStr);
			// dateList 에는 [0228,0301 ...] 데이터가 들어가있다.

		}
		return dateList;
	}

	public static List<Map<String, Object>> getChartList(List<Map<String, Object>> list) {

		// subscriberCountList에서 우리가 그래프에 출력해줄 dateList에 있는 날짜에 해당하는 값만 받아올 것! (해당날짜, 값
		// (or없으면 0)) 을 list로
		List<Map<String, Object>> chartList = new ArrayList<Map<String, Object>>();
		List<String> dateList = getDateList();
		
		for (String date : dateList) {
			
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			
			for (Map<String, Object> item : list) {

				if (date.equals(item.get("DATE").toString())) {

					map.put("date", date);
					map.put("count", item.get("TOTAL"));
					System.out.println(date + "데이터는: " + item.get("TOTAL"));

					break;

				} else {
					map.put("date", date);
					map.put("count", 0);
				}
				
				
			} // for subscriberCount end

			chartList.add(map);
		} // dateList end

		return chartList;
	}
	
	//0305최종 추가
	public static List<String> getMonthList() {
		// 차트에 출력하기위해서 오늘로부터 총 11일전까지 총 12일간의 날짜가 필요하다 -> mmyy 의 형태로 리스트에 담아줌
		List<String> monthList = new ArrayList<String>();

		// 현재날짜를 기본으로 하는 calendar객체 얻어온다.
		Calendar cal = Calendar.getInstance();
		// 3월4일이면 0304 같은 형태로 받아올것
		DecimalFormat df = new DecimalFormat("00");

		// for 문을 돌려서 현재날짜부터 -11일 부터 0일

		for (int i = 0; i < 12; i++) {
			if (i == 0) {

			} else {

				cal.add(cal.MONTH, -1);
			}

			//년과 달을 받아서 dateList에 추가
			String monthStr = df.format(cal.get(Calendar.MONTH) + 1);
			String yearStr = df.format(cal.get(Calendar.YEAR));
			String YearMonthStr = yearStr + monthStr;

			monthList.add(0, YearMonthStr);
			

		}
		return monthList;
	}
	
	public static List<Map<String, Object>> getChartByMonth(List<Map<String, Object>> list) {

		// subscriberCountList에서 우리가 그래프에 출력해줄 dateList에 있는 날짜에 해당하는 값만 받아올 것! (해당날짜, 값
		// (or없으면 0)) 을 list로
		List<Map<String, Object>> chartByMonthList = new ArrayList<Map<String, Object>>();
		List<String> monthList = getMonthList();
		
		for (String month : monthList) {
			
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			
			for (Map<String, Object> item : list) {

				if (month.equals(item.get("MONTH").toString())) {

					map.put("month", month);
					map.put("count", item.get("TOTAL"));
					System.out.println(month + "데이터는: " + item.get("TOTAL"));

					break;

				} else {
					map.put("month", month);
					map.put("count", 0);
				}
				
				
			} // for subscriberCount end

			chartByMonthList.add(map);
		} // dateList end

		return chartByMonthList;
	}
	


}
