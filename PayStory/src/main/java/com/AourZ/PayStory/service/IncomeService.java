package com.AourZ.PayStory.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.dao.IIncomeDAO;
import com.AourZ.PayStory.model.IncomeVO;

@Service
public class IncomeService implements IIncomeService {
	
	@Autowired
	@Qualifier("IIncomeDAO")
	IIncomeDAO dao;
	
	@Override
	public ArrayList<IncomeVO> listAllIncome() {
		// TODO Auto-generated method stub
		return dao.listAllIncome();
	}
	
	@Override
	public ArrayList<IncomeVO> incomeSearch(HashMap<String, Object> map){
		return dao.incomeSearch(map);
	}

}
