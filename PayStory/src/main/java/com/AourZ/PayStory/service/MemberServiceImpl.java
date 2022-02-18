package com.AourZ.PayStory.service;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.AourZ.PayStory.DAO.MemberDAO;
import com.AourZ.PayStory.mail.IMailSender;
import com.AourZ.PayStory.mail.TempKey;
import com.AourZ.PayStory.model.LoginVO;
import com.AourZ.PayStory.model.MailUtils;
import com.AourZ.PayStory.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject 
	private MemberDAO memberDAO;
	@Autowired
	private IMailSender mailSender;
	
	@Transactional
	@Override
	public void register(MemberVO memberVO) throws Exception{
		memberDAO.register(memberVO);
		
		String key = new TempKey().getKey(50,false);
		memberDAO.createAuthKey(memberVO.getMemberEmail(), key);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[PayStory 이메일 인증메일 입니다.]"); 
		sendMail.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+memberVO.getMemberName()+"님 "+
						"<br/>PayStory에 회원가입해주셔서 감사합니다."+
						"<br/>[이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost:8080/member/registerEmail?memberEmail=" + memberVO.getMemberEmail() +
						"&key=" + key +
						"' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("paystory.aourz@gmail.com", "PayStory");
		sendMail.setTo(memberVO.getMemberEmail());
		sendMail.send(); 
	}
	
	@Override
	public void memberAuth(String memberEmail) throws Exception{
		memberDAO.memberAuth(memberEmail);
	}

	@Override
	public int nameCnt(MemberVO memberVO)throws Exception{
		return memberDAO.nameCnt(memberVO);
	}
	
	@Override
	public MemberVO login(LoginVO loginVO)throws Exception{
		return memberDAO.login(loginVO);
	}
	

}	