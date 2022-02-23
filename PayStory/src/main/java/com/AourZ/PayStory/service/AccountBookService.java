package com.AourZ.PayStory.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IAccountBookDAO;
import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;

@Service
public class AccountBookService implements IAccountBookDAO {
	@Autowired
	@Qualifier("IAccountBookDAO")
	IAccountBookDAO dao;

	@Override
	public void insertIncome(IncomeVO incomeVO) {
		dao.insertIncome(incomeVO);
	}

	@Override
	public void insertExpenditure(ExpenditureVO expenditureVO) {
		dao.insertExpenditure(expenditureVO);
	}

	@Override
	public void insertExpenditureItem(ExpenditureItemVO expenditureItemVO) {
		dao.insertExpenditureItem(expenditureItemVO);
	}

}
