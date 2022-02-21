package com.AourZ.PayStory.service;


import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.AourZ.PayStory.dao.IMemberDAO;
import com.AourZ.PayStory.mail.IMailSender;
import com.AourZ.PayStory.mail.TempKey;
import com.AourZ.PayStory.model.LoginVO;
import com.AourZ.PayStory.model.MailUtils;
import com.AourZ.PayStory.model.MemberVO;

@Service
public class MemberService implements IMemberService {
	
	@Inject 
	private IMemberDAO memberDAO;
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
	
	@Override
	public int findPwCheck(MemberVO memberVO)throws Exception{
		return memberDAO.findPwCheck(memberVO);
	}
    
    @Override
	public void findPw(String memberEmail,String memberName)throws Exception{
		String memberKey = new TempKey().getKey(6,false);
		String memberPwd = BCrypt.hashpw(memberKey,BCrypt.gensalt());
		 memberDAO.findPw(memberEmail,memberName,memberPwd);
		 MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[PayStory 임시 비밀번호 입니다.]"); 
			sendMail.setText(
					"<h1>임시비밀번호 발급</h1>" +
							"<br/>"+memberName+"님 "+
							"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
							"<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
							"<br/>로그인 후 비밀번호 변경을 해주세요."+
							"<a href='http://localhost:8080/member/loginView"+
							">로그인 페이지</a>");
			sendMail.setFrom("paystory.aourz@gmail.com", "PayStory");
			sendMail.setTo(memberEmail);
			sendMail.send();
	}
    
    @Override
	public void infoUpdate(MemberVO memberVO)throws Exception{
		memberDAO.infoUpdate(memberVO);
	}

    @Override
	public String pwCheck(String memberEmail)throws Exception{
		return memberDAO.pwCheck(memberEmail);
	}
	
	@Override
	public void pwUpdate(String memberEmail, String hashedPw)throws Exception{
		memberDAO.pwUpdate(memberEmail, hashedPw);
	}

}	