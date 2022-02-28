package com.AourZ.PayStory.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.AourZ.PayStory.model.TagTotalVO;
import com.AourZ.PayStory.service.AccountBookService;

@Repository
public class AccountBookMethod {
	@Autowired
	private AccountBookService accountBookService;

	/* 수입 / 지출 데이터 조회 */
	ArrayList<TagTotalVO> selectTagTotalList(String criterion, int accountBookNo, String group1, String group2,
			String date) {
		ArrayList<TagTotalVO> voList = new ArrayList<TagTotalVO>();

		if (criterion.equals("income")) {
			voList = accountBookService.selectIncomeList(accountBookNo, group1, group2, date);
		} else if (criterion.equals("expenditure")) {
			voList = accountBookService.selectExpenditureList(accountBookNo, group1, group2, date);
		}

		return voList;
	}

	/* 숫자 0 채우기 */
	String zeroFill(int num) {
		String text = "";

		if (num < 10) {
			text = "0" + Integer.toString(num);
		} else {
			text = Integer.toString(num);
		}

		return text;
	}

	/* 현재 년-월 (시스템 시간 기준) */
	String nowDate() {
		LocalDate localDate = LocalDate.now();
		String year = Integer.toString(localDate.getYear());
		String month = zeroFill(localDate.getMonthValue());

		String date = year + "-" + month;

		return date;
	}

	/* 대시보드 메인 / 조회 - 달력((A / B) / C) : 수입 / 지출 날짜별 총 건수, 총 금액 */
	ArrayList<TagTotalVO> createDataList(ArrayList<TagTotalVO> dataList, int lastDate) {
		ArrayList<TagTotalVO> resultList = new ArrayList<TagTotalVO>();

		for (int i = 0; i < lastDate; i++) {
			TagTotalVO vo = new TagTotalVO();

			resultList.add(vo);
		}

		for (int i = 0; i < dataList.size(); i++) {
			String[] tempDate = dataList.get(i).getDate().split("-");
			int day = Integer.parseInt(tempDate[tempDate.length - 1]) - 1;

			dataList.get(i).setTag(replaceTag(dataList.get(i).getTag())); // 태그 번호 to 태그 이름

			resultList.set(day, dataList.get(i));
		}

		return resultList;
	}

	/* 대시보드 메인 - 달력(A / B) : 수입 / 지출 날짜별 태그별 총 건수, 총 금액 */
	ArrayList<ArrayList<TagTotalVO>> createDetailDataList(ArrayList<TagTotalVO> dataList, int lastDate) {
		ArrayList<ArrayList<TagTotalVO>> resultItemList = new ArrayList<ArrayList<TagTotalVO>>();

		for (int i = 0; i < lastDate; i++) {
			ArrayList<TagTotalVO> voArray = new ArrayList<TagTotalVO>();

			resultItemList.add(voArray);
		}

		for (int i = 0; i < dataList.size(); i++) {
			String[] tempDate = dataList.get(i).getDate().split("-");
			int day = Integer.parseInt(tempDate[tempDate.length - 1]) - 1;

			dataList.get(i).setTag(replaceTag(dataList.get(i).getTag())); // 태그 번호 to 태그 이름

			resultItemList.get(day).add(dataList.get(i));
		}

		return resultItemList;
	}

	/* 태그 번호 to 태그 이름 */
	String replaceTag(String tagNo) {
		String tagName = accountBookService.selectTagName(tagNo);

		return tagName;
	}

	/* 카테고리 번호 to 카테고리 이름 */
	String replaceCategory(String categoryNo) {
		String categoryName = accountBookService.selectBoardCategoryName(categoryNo);

		return categoryName;
	}
}
