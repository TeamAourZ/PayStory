package com.AourZ.PayStory.service;

import com.AourZ.PayStory.model.LoginVO;
import com.AourZ.PayStory.model.MemberVO;

public interface MemberService {
	public void register(MemberVO memberVO) throws Exception;
	public int nameCnt(MemberVO memberVO)throws Exception;
	public MemberVO login(LoginVO loginVO)throws Exception;
	public void memberAuth(String memberEmail) throws Exception;

}
