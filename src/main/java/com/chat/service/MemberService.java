package com.chat.service;

import com.chat.vo.Member;

public interface MemberService {

	public int loginAction(Member members) throws Exception;
	public void joinAction(Member members) throws Exception;
	public Member viewMember(String m_id) throws Exception;
	public Member readMember(String id);
	public Member findId(String m_id, String m_email) throws Exception;
	public void infoChange(Member member) throws Exception;
}
