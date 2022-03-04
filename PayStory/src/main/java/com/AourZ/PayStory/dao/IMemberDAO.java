package com.AourZ.PayStory.dao;


import java.util.List;

import com.AourZ.PayStory.model.board.BoardVO;
import com.AourZ.PayStory.model.member.LoginVO;
import com.AourZ.PayStory.model.member.MemberVO;

public interface IMemberDAO {
	public void register(MemberVO memberVO) throws Exception;
	public int nameCnt(MemberVO memberVO)throws Exception;
	public MemberVO login(LoginVO loginVO)throws Exception;
	public void createAuthKey(String memberEmail,String authKey) throws Exception;
	public void memberAuth(String memberEmail) throws Exception;
	public int findPwCheck(MemberVO memberVO)throws Exception;
	public int findPw(String memberPwd, String memberEmail, String memberName)throws Exception;
	public void infoUpdate(MemberVO memberVO)throws Exception;	
	public String pwCheck(String memberEmail)throws Exception;
	public void pwUpdate(String memberEmail, String hashedPw)throws Exception;
	public void updateImg(String memberImage, String memberEmail)throws Exception;
	public int emailCnt(String memberEmail)throws Exception;
	public List<MemberVO> memberList();
	public void memberSanction(int sanctionTime, String memberEmail)throws Exception;
	public void memberSanctionCancel(String memberEmail)throws Exception;
	public int memberRankCheck(String memberEmail)throws Exception;
	public Object memberSanctionTime(String memberEmail)throws Exception;
	public void memberMaster(String memberEmail)throws Exception;
	public void memberMasterCancel(String memberEmail)throws Exception;
	// 공지사항
	public List<BoardVO> noticeBoardList();
	public void insertNotice(int boardNo)throws Exception;
	public void deleteNotice(int boardNo)throws Exception;
}
