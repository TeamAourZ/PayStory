package com.AourZ.PayStory.model.accountBook;

import java.util.Comparator;

public class DetailViewItemComparator implements Comparator<DetailViewItemVO> {
	@Override
	public int compare(DetailViewItemVO item1, DetailViewItemVO item2) {
		return item1.getDate().compareTo(item2.getDate());
	}
}
