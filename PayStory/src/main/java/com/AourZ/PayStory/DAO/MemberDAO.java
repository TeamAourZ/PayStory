package com.AourZ.PayStory.DAO;

import com.AourZ.PayStory.model.LoginVO;
import com.AourZ.PayStory.model.MemberVO;

public interface MemberDAO {
	public void register(MemberVO memberVO) throws Exception;
	public int nameCnt(MemberVO memberVO)throws Exception;
	public MemberVO login(LoginVO loginVO)throws Exception;
	public void createAuthKey(String memberEmail,String authKey) throws Exception;
	public void memberAuth(String memberEmail) throws Exception;
}

