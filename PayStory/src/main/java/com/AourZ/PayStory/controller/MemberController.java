package com.AourZ.PayStory.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.AourZ.PayStory.model.LoginVO;
import com.AourZ.PayStory.model.MemberVO;
import com.AourZ.PayStory.service.MemberService;



@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject 
	private MemberService memberService;
	
	
	//  ****************** 회원가입 ****************** 
	@RequestMapping(value="/registerView",method= RequestMethod.GET)
	public String registerView() throws Exception{
		logger.info("registerView");
		return "/member/registerView";
	}
	
	// 회원가입 처리(암호화 비밀번호) / 랜덤번호 부여 / 이메일인증
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(MemberVO memberVO, RedirectAttributes rttr, Model model)throws Exception{
		logger.info("register");
		String hashedPw = BCrypt.hashpw(memberVO.getMemberPwd(), BCrypt.gensalt());
		
		String rNum = "";
		 for(int i=1; i<=4; i++) {
			 rNum += (int)(Math.random() * 10);
		 }
		 
		 String memberNo = rNum;
		
		memberVO.setMemberPwd(hashedPw);
		memberVO.setMemberNo(memberNo);
		memberService.register(memberVO);
		model.addAttribute("member", memberVO);
		
		 
		rttr.addFlashAttribute("msg", "가입이 완료되었습니다.");
		rttr.addAttribute("memberEmail", memberVO.getMemberEmail());
		rttr.addAttribute("memberName", memberVO.getMemberName());
		
		return "redirect:/member/registerAuth";
	}
	
	@RequestMapping(value="/registerAuth",method= RequestMethod.GET)
	public String loginView(HttpServletRequest request,Model model,@RequestParam("memberEmail")String memberEmail,@RequestParam("memberName")String memberName) throws Exception{
		logger.info("loginView");
		
		model.addAttribute("memberEmail", memberEmail);
		model.addAttribute("memberName", memberName);
		
		
		return "/member/registerAuth";
	}
	
	// ****************** 이메일 ******************
	@RequestMapping(value="registerEmail", method=RequestMethod.GET)
	public String emailConfirm(String memberEmail,Model model)throws Exception{
		memberService.memberAuth(memberEmail);
		model.addAttribute("memberEmail", memberEmail);
		
		return "/member/registerEmail";
	}
	
	// 닉네임 체크
	@RequestMapping(value="/nameCnt", method=RequestMethod.POST)
	@ResponseBody
	public String nameCnt(@RequestBody String filterJSON,HttpServletResponse response, ModelMap model)throws Exception{
		JSONObject resMap= new JSONObject();
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			MemberVO searchVO = (MemberVO) mapper.readValue(filterJSON, new TypeReference<MemberVO>()
					{});
			int nameCnt = memberService.nameCnt(searchVO);
			logger.info("nameCnt"+nameCnt);
			
			resMap.put("res", "ok");
			resMap.put("nameCnt", nameCnt);
			
		}catch(Exception e) {
			System.out.println(e.toString());
			resMap.put("res","error");
		}
		
		logger.info("nameCnt"+resMap);
		response.setContentType("text/html: charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(resMap);
		
		return null;
	}
	
	//  ****************** 로그인 ******************
	@RequestMapping(value="/loginView",method= RequestMethod.GET)
	public String loginView(@ModelAttribute("loginVO")LoginVO loginVO,HttpServletRequest request,Model model) throws Exception{
		logger.info("loginView");
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(null != inputFlashMap) {
			model.addAttribute("msg",(String) inputFlashMap.get("msg"));
		}
		return "/member/loginView";
	}
	
	// 로그인 처리
	@RequestMapping(value="/login" , method= RequestMethod.POST)
	public String loginPost(LoginVO loginVO, HttpSession httpSession, Model model) throws Exception{
		logger.info("loginVO"+loginVO.getMemberEmail());
		MemberVO memberVO = memberService.login(loginVO);
		logger.info("Pw"+memberVO);
		if( memberVO == null || !BCrypt.checkpw(loginVO.getMemberPwd(), memberVO.getMemberPwd())) {
			return "/member/loginCheck";
		}
		
		if(memberVO.getMemberAuth() == 0) {
			model.addAttribute("Auth", memberVO.getMemberAuth());
			return "/member/registerReady";
		}
		
		model.addAttribute("member", memberVO);
		
		return "/index";
	}
	
	// ****************** 비밀번호 찾기 ******************
	@RequestMapping(value="/findPwView" , method=RequestMethod.GET)
	public String findPwView() throws Exception{
		return"/member/findPwView";
	}
		
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	public String findPw(MemberVO memberVO,Model model) throws Exception{
		logger.info("memberPwd"+memberVO.getMemberName());
		
		if(memberService.findPwCheck(memberVO) == 0) {
			logger.info("memberPWCheck");
			model.addAttribute("msg", "아이디와 이메일를 확인해주세요");
			
			return "/member/findPwView";
		}else {
	
		memberService.findPw(memberVO.getMemberEmail(),memberVO.getMemberName());
		model.addAttribute("member", memberVO.getMemberEmail());
		
		return"/member/findPw";
		}
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	
}
