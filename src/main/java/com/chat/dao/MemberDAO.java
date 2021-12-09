package com.chat.dao;

import com.chat.vo.Member;

public interface MemberDAO {

	public Member login(Member members) throws Exception;
}
