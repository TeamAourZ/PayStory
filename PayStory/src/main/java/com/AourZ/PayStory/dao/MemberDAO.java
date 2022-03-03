package com.AourZ.PayStory.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.AourZ.PayStory.model.board.BoardVO;
import com.AourZ.PayStory.model.member.LoginVO;
import com.AourZ.PayStory.model.member.MemberVO;
import com.AourZ.PayStory.service.accountBook.AccountBookService;

@Repository
public class MemberDAO implements IMemberDAO {
	
	@Inject
	private SqlSession sqlsession;
	
	@Autowired
	private AccountBookService accountBookService;
		
	@Override
	public void register(MemberVO memberVO) throws Exception{
		sqlsession.insert("com.AourZ.PayStory.dao.IMemberDAO.register", memberVO);	
	}
	
	@Override
	public int nameCnt(MemberVO memberVO)throws Exception{
		return sqlsession.selectOne("com.AourZ.PayStory.dao.IMemberDAO.nameCnt", memberVO);
	}
	
	@Override
	public int emailCnt(String memberEmail)throws Exception{
		return sqlsession.selectOne("com.AourZ.PayStory.dao.IMemberDAO.emailCnt", memberEmail);
	}
	
	@Override
	public MemberVO login(LoginVO loginVO)throws Exception{
		System.out.println("DAOloginVO"+loginVO.getMemberPwd());
		return sqlsession.selectOne("com.AourZ.PayStory.dao.IMemberDAO.login", loginVO);
	}
	
	@Override
	public void createAuthKey(String memberEmail,String authKey) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlsession.selectOne("com.AourZ.PayStory.dao.IMemberDAO.createAuthKey", map);
		
	}
	
	@Override
	public void memberAuth(String memberEmail) throws Exception{
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.memberAuth", memberEmail);
		
		// 회원 번호 조회
		String memberNo = accountBookService.selectMemberNo(memberEmail);
		
		// 일반 가계부 생성
		accountBookService.createMyAccountBook(memberNo);
	}
	
	@Override
	public int findPwCheck(MemberVO memberVO)throws Exception{
	return sqlsession.selectOne("com.AourZ.PayStory.dao.IMemberDAO.findPwCheck", memberVO);	
	}

	@Override
	public int findPw(String memberEmail,String memberName,String memberPwd)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("memberName", memberName);
		map.put("memberPwd", memberPwd);
		return sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.findPw", map);
	}
	
	@Override
	public void infoUpdate(MemberVO memberVO)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberName", memberVO.getMemberName());	
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.infoUpdate", map);
	}
	
	@Override
	public String pwCheck(String memberEmail)throws Exception{
		return sqlsession.selectOne("com.AourZ.PayStory.dao.IMemberDAO.pwCheck", memberEmail);
	}
	
	@Override
	public void pwUpdate(String memberEmail, String hashedPw) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("memberPwd", hashedPw);
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.pwUpdate", map);	
	}
	
	@Override
	public void updateImg(String memberImage, String memberEmail) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberImage", memberImage);
		map.put("memberEmail", memberEmail);
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.updateImg", map);
	}
	
	@Override
	public List<MemberVO> memberList(){
		return sqlsession.selectList("com.AourZ.PayStory.dao.IMemberDAO.memberList");	
	}
	
	@Override
	public void memberSanction(int sanctionTime, String memberEmail) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("sanctionTime", sanctionTime);
		map.put("memberEmail", memberEmail);
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.memberSanction", map);
	}
	
	@Override
	public void memberSanctionCancel(String memberEmail) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.memberSanctionCancel", map);
	}
	
	@Override
	public int memberRankCheck(String memberEmail)throws Exception{
		return sqlsession.selectOne("com.AourZ.PayStory.dao.IMemberDAO.memberRankCheck", memberEmail);
	}

	@Override
	public Object memberSanctionTime(String memberEmail)throws Exception{
		return sqlsession.selectOne("com.AourZ.PayStory.dao.IMemberDAO.memberSanctionTime", memberEmail);
	}
	
	@Override
	public void insertNotice(int boardNo) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.insertNotice", map);
	}
	
	@Override
	public void deleteNotice(int boardNo) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.deleteNotice", map);
	}
	
	@Override
	public void memberMaster(String memberEmail) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.memberMaster", map);
	}
	
	@Override
	public void memberMasterCancel(String memberEmail) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		sqlsession.update("com.AourZ.PayStory.dao.IMemberDAO.memberMasterCancel", map);
	}
	
	// 공지사항
	@Override
	public List<BoardVO> boardList(){
		return sqlsession.selectList("com.AourZ.PayStory.dao.IMemberDAO.boardList");
	}
	
}
