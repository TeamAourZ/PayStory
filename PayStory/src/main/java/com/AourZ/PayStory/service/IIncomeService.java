package com.AourZ.PayStory.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.AourZ.PayStory.model.IncomeVO;

public interface IIncomeService {
	ArrayList<IncomeVO> listAllIncome();
	ArrayList<IncomeVO> incomeSearch(HashMap<String, Object> map);
}
