package com.AourZ.PayStory.model.accountBook;

import java.util.ArrayList;
import java.util.Comparator;

public class ExpenditureItemComparator implements Comparator<ArrayList<ExpenditureItemVO>> {
	@Override
	public int compare(ArrayList<ExpenditureItemVO> item1, ArrayList<ExpenditureItemVO> item2) {
		if (item1.get(0).getExpenditureNo() > item2.get(0).getExpenditureNo()) {
			return 1;
		} else if (item1.get(0).getExpenditureNo() < item2.get(0).getExpenditureNo()) {
			return -1;
		}

		return 0;
	}
}
