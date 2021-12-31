package com.chat.service;

import javax.servlet.http.HttpServletResponse;

import com.chat.vo.Authmail;
import com.chat.vo.Member;

public interface MemberService {

	public int loginAction(Member members) throws Exception;
	public void joinAction(Member members) throws Exception;
	public Member viewMember(String m_id) throws Exception;
	public Member readMember(String id);
	public void changeInfo(Member member) throws Exception;
	public String find_id2(HttpServletResponse response, Member member) throws Exception;
	public String find_id(HttpServletResponse response, Member member) throws Exception;
	public void findpw(HttpServletResponse rs, Member member) throws Exception;
	public int setAuthnum(String m_email) throws Exception;
	public int checkAuthnum(Authmail authmail) throws Exception;
	public void sendemail(Member member, String div) throws Exception;
	
}
