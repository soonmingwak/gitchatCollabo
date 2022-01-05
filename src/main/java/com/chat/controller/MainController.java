package com.chat.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chat.service.MemberService;
import com.chat.vo.DateDate;
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
	
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public String findpw() throws Exception{
		return "main/findpw";
	}
	
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public String findpw(@ModelAttribute Member member, HttpServletResponse response) throws Exception {
		
		MemberService.findpw(response, member);
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
	
	@RequestMapping(value = "/memberlist")
	public String memberlit(Model model) throws Exception {
		List<Member> list =MemberService.memberList();
		model.addAttribute("list",list);
		return "main/memberlist";
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

	
	
	@RequestMapping(value = "/calendar2", method = RequestMethod.GET)
	public String calendar2(Model model, HttpServletRequest request, DateDate dateData){
		
		Calendar cal = Calendar.getInstance();
		DateDate calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateDate(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateDate> dateList = new ArrayList<DateDate>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateDate(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateDate(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateDate(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateDate(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "main/calendar2";
	}

	@RequestMapping(value = "/chat")
	public String chat() {
		return "main/chat";
	}
	@RequestMapping(value ="/idCheck",method = RequestMethod.GET)
	
	@ResponseBody
	public String idCheck(String m_id) throws Exception{
		
		int result =MemberService.idCheck(m_id);
		
		
		return result+"";
	}
	
}
