package com.AourZ.PayStory.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.AourZ.PayStory.model.IncomeVO;


public interface IIncomeDAO {
	ArrayList<IncomeVO> listAllIncome();
//	IncomeVO yearViewIncome(String incomeNo);
//	IncomeVO monthViewIncome(String incomeNo);
//	IncomeVO dayViewIncome(String incomeNo);
	ArrayList<IncomeVO> incomeSearch(HashMap<String, Object> map);
}
