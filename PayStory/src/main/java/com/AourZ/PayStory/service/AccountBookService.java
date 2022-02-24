package com.AourZ.PayStory.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IAccountBookDAO;
import com.AourZ.PayStory.model.ExpenditureItemVO;
import com.AourZ.PayStory.model.ExpenditureVO;
import com.AourZ.PayStory.model.IncomeVO;

@Service
public class AccountBookService implements IAccountBookService {
	@Autowired
	@Qualifier("IAccountBookDAO")
	IAccountBookDAO dao;

	@Override
	public void insertIncome(IncomeVO vo) {
		dao.insertIncome(vo);
	}

	@Override
	public void insertExpenditure(ExpenditureVO vo) {
		dao.insertExpenditure(vo);
	}

	@Override
	public void insertExpenditureItem(ArrayList<ExpenditureItemVO> list) {
		dao.insertExpenditureItem(list);
	}
}
