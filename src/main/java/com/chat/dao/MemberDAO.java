package com.chat.dao;

import com.chat.vo.Member;

public interface MemberDAO {

	public Member login(Member members) throws Exception;
	public void join(Member member) throws Exception;
	public Member viewMember(String m_id) throws Exception;
}
