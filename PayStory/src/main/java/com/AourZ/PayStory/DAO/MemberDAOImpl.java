package com.AourZ.PayStory.DAO;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.AourZ.PayStory.model.LoginVO;
import com.AourZ.PayStory.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public void register(MemberVO memberVO) throws Exception{
		sqlsession.insert("memberMapper.register", memberVO);	
	}
	
	@Override
	public int nameCnt(MemberVO memberVO)throws Exception{
		return sqlsession.selectOne("memberMapper.nameCnt", memberVO);
	}
	
	@Override
	public MemberVO login(LoginVO loginVO)throws Exception{
		System.out.println("DAOloginVO"+loginVO.getMemberPwd());
		return sqlsession.selectOne("memberMapper.login", loginVO);
	}
	
	@Override
	public void createAuthKey(String memberEmail,String authKey) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlsession.selectOne("memberMapper.createAuthKey", map);
		
	}
	
	@Override
	public void memberAuth(String memberEmail) throws Exception{

		sqlsession.update("memberMapper.memberAuth", memberEmail);
	}


}
