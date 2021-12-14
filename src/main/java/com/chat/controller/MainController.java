package com.chat.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chat.service.MemberService;
import com.chat.vo.Member;

@Controller
public class MainController {
	

	@Inject
	MemberService MemberService;

	@RequestMapping(value = "/")
	public String chatlogin() {
		
		return "main/chatlogin";
	}
	
	@RequestMapping(value = "/main")
	public String main() {
		return "main/main";
	}

	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(Member members,HttpSession session,RedirectAttributes ra) throws Exception{
		
		int result =MemberService.loginAction(members);
		String url =null;
		
		if(result ==0) {
			session.setAttribute("m_id", members.getM_id());
		
			url="redirect:/main";
		}
		else {
			ra.addFlashAttribute("msg","로그인정보가 일치하지 않습니다.");
			url="redirect:/chatlogin";
			
		}
		
		return url;
	}
	
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) throws Exception {
	
		model.addAttribute("msg","반갑습니다.");
		
		return "main/join";
	}
	@RequestMapping(value = "/joinAction", method =RequestMethod.POST)
	public String joinAction(Member members,String addr1, String addr2, String addr3) throws Exception{
		members.setM_adr(addr1+" "+addr2+" " +addr3);
		MemberService.joinAction(members);
		
		return "redirect:/";
	}
	@RequestMapping(value = "/findid")
	public String findid() {
		return "main/findid";
	}

	@RequestMapping(value = "/findpw")
	public String findpw() {
		return "main/findpw";
	}

	@RequestMapping(value = "/calender")
	public String calender() {
		return "main/calender";
	}

	@RequestMapping(value = "/notice")
	public String notice() {
		return "main/notice";
	}
	

	@RequestMapping(value = "/att")
	public String att() {
		return "main/att";
	}

	@RequestMapping(value = "/todo")
	public String todo() {
		return "main/todo";
	}

	@RequestMapping(value = "/orgchart")
	public String orgchart() {
		return "main/orgchart";
	}

	@RequestMapping(value = "/chat")
	public String chat() {
		return "main/chat";
	}
}
