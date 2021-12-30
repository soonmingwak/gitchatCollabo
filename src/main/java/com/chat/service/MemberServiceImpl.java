package com.chat.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.chat.dao.MemberDAO;
import com.chat.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	
	@Override
	public int loginAction(Member members) throws Exception {
		
		if(dao.login(members) == null) {
			return 1;
		}
		return 0;
		
	}

	@Override
	public void joinAction(Member members) throws Exception {
		dao.join(members);
		
	}

	@Override
	public Member viewMember(String m_id) throws Exception {
		
		return dao.viewMember(m_id);
	}

	@Override
	public Member readMember(String m_id) {
		
		Member mb = null;
		
		try {
			mb = dao.readMember(m_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mb;
	}

	

	@Override
	public void changeInfo(Member member) throws Exception {
		System.out.println("member="+member.getM_adr());
		dao.changeInfo(member);
		
	}



	@Override
	public String find_id(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id(member);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	@Override
	public String find_id2(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.find_id2(member);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
}
