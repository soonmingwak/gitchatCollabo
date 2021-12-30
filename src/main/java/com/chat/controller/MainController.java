package com.chat.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			ra.addFlashAttribute("msg","로그인정보가 일치하지 않습니다..");
			url="redirect:/chatlogin";
			
		}
		
		return url;
	}
	
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	
	public String logout(HttpSession session) throws Exception{
		
		
		session.invalidate();
		
		return "redirect:/";
	}
	@RequestMapping(value = "/join")
	public String join(Model model) throws Exception {
	
		
		
		return "main/join";
	}
	@RequestMapping(value = "/joinAction", method =RequestMethod.POST)
	public String joinAction(Member members,String m_addr1, String m_addr2, String m_addr3) throws Exception{
		members.setM_adr(m_addr1+" "+m_addr2+" "+m_addr3);
		MemberService.joinAction(members);
		
		return "redirect:/";
	}
	@RequestMapping(value = "/findid")
	public String findid(Member members) {
	//	MemberService.fidId(String m_name, String m_email);
		return "main/findid";
	}
	@RequestMapping(value = "/findidAction", method =RequestMethod.POST)
	public String findidAction(HttpServletResponse response, Model md, Member member)throws Exception {
		
		
		
		if((member.getM_name()!=null&&member.getM_tel()!=null)&&member.getM_email()==null) {
			System.out.println("11"+member.getM_email());
			md.addAttribute("id",MemberService.find_id(response, member));
		
		}else if((member.getM_name()!=null&&member.getM_email()!=null)&&member.getM_tel()==null) {
			System.out.println("22"+member.getM_email());
			md.addAttribute("id",MemberService.find_id2(response, member));
		}
		
		return "main/findview";
	}

	@RequestMapping(value = "/findpw")
	public String findpw() {
		return "main/findpw";
	}
	
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(Model model, HttpSession session, Member members) throws Exception {
		
		String id = (String)session.getAttribute("m_id");
	
		
		
		members = MemberService.readMember(id);
		model.addAttribute("member", members);
		
	
		return "main/info";
		
		
		
	}
	@RequestMapping(value = "/infochange")
	public String infochange(HttpSession session ) throws Exception {
		
		String id = (String)session.getAttribute("m_id");
		
		return "main/infochange";
	}
	@RequestMapping(value = "/changeAction", method = RequestMethod.POST)
	public String changeAction(HttpSession session, Member members, String m_adr1, String m_adr2, String m_adr3) throws Exception{
		members.setM_adr(m_adr1+" "+m_adr2+" "+m_adr3);
		System.out.println(m_adr1);
		System.out.println(m_adr2);
		System.out.println(m_adr3);
		System.out.println(members.getM_adr());
		System.out.println(members.getM_name());
		MemberService.changeInfo(members);
		session.invalidate();
		return "redirect:/";
//		MemberService.infoChange(member);
//		return "redirect:/main/infochange?m_id="+member.getM_id();
		//session.setAttribute("member", MemberService.infoChange(member));
		//return "redirect:/main/infochange?m_id="+member.getM_id();
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
