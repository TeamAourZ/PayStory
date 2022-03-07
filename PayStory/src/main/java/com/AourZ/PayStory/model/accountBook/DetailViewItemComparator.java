package com.AourZ.PayStory.model.accountBook;

import java.util.Comparator;

public class DetailViewItemComparator implements Comparator<DetailViewItemVO> {
	@Override
	public int compare(DetailViewItemVO item1, DetailViewItemVO item2) {
		int castingItem1 = Integer.parseInt(item1.getDate());
		int castingItem2 = Integer.parseInt(item2.getDate());

		if (castingItem1 > castingItem2) {
			return 1;
		} else if (castingItem1 < castingItem2) {
			return -1;
		}

		return 0;
	}
}
