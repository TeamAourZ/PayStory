package com.AourZ.PayStory.service;

import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;

public interface IAccountBookService {
	public void insertIncome(IncomeVO incomeVO); // 수입 항목 추가
	public void insertExpenditure(ExpenditureVO expenditureVO); // 지출 항목 추가
	public void insertExpenditureItem(ExpenditureItemVO expenditureItemVO); // 지출 아이템 추가
}
