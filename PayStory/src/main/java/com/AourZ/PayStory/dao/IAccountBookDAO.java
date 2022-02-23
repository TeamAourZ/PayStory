package com.AourZ.PayStory.dao;

import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;

public interface IAccountBookDAO {
	public void insertIncome(IncomeVO incomeVO); // 수입 항목 추가
	public void insertExpenditure(ExpenditureVO expenditureVO); // 지출 항목 추가
	public void insertExpenditureItem(ExpenditureItemVO expenditureItemVO); // 지출 아이템 추가
}