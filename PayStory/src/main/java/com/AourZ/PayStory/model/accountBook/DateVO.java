package com.AourZ.PayStory.model.accountBook;

public class DateVO {
	private String date;				// 날짜 (년-월-일)
	private int day;					// 일
	private String holidayName;	// 휴무일 명칭

	public String getDate() {
		return date;
	}

	public int getDay() {
		return day;
	}

	public String getHolidayName() {
		return holidayName;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public void setHolidayName(String holidayName) {
		this.holidayName = holidayName;
	}

}
