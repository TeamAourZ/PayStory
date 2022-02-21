package com.AourZ.PayStory.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.AourZ.PayStory.model.LoginVO;
import com.AourZ.PayStory.model.MemberVO;

@Repository
public class MemberDAO implements IMemberDAO {
	
	@Inject
	private SqlSession sqlsession;
	
	
	@Override
	public void register(MemberVO memberVO) throws Exception{
		sqlsession.insert("com.AourZ.PayStory.dao.MemberDAO.register", memberVO);	
	}
	
	@Override
	public int nameCnt(MemberVO memberVO)throws Exception{
		return sqlsession.selectOne("com.AourZ.PayStory.dao.MemberDAO.nameCnt", memberVO);
	}
	
	@Override
	public MemberVO login(LoginVO loginVO)throws Exception{
		System.out.println("DAOloginVO"+loginVO.getMemberPwd());
		return sqlsession.selectOne("com.AourZ.PayStory.dao.MemberDAO.login", loginVO);
	}
	
	@Override
	public void createAuthKey(String memberEmail,String authKey) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlsession.selectOne("com.AourZ.PayStory.dao.MemberDAO.createAuthKey", map);
		
	}
	
	@Override
	public void memberAuth(String memberEmail) throws Exception{

		sqlsession.update("com.AourZ.PayStory.dao.MemberDAO.memberAuth", memberEmail);
	}
	
	@Override
	public int findPwCheck(MemberVO memberVO)throws Exception{
	return sqlsession.selectOne("com.AourZ.PayStory.dao.MemberDAO.findPwCheck", memberVO);	
	}


	@Override
	public int findPw(String memberEmail,String memberName,String memberPwd)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("memberName", memberName);
		map.put("memberPwd", memberPwd);
		return sqlsession.update("com.AourZ.PayStory.dao.MemberDAO.findPw", map);
	}
	
	@Override
	public void infoUpdate(MemberVO memberVO)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberName", memberVO.getMemberName());
		
	sqlsession.update("com.AourZ.PayStory.dao.MemberDAO.infoUpdate", map);
	}
	
	@Override
	public String pwCheck(String memberEmail)throws Exception{
		return sqlsession.selectOne("com.AourZ.PayStory.dao.MemberDAO.pwCheck", memberEmail);
	}
	
	@Override
	public void pwUpdate(String memberEmail, String hashedPw) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("memberPwd", hashedPw);
		sqlsession.update("com.AourZ.PayStory.dao.MemberDAO.pwUpdate", map);
		
	}
	

}
