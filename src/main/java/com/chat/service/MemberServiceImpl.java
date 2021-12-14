package com.chat.service;

import javax.inject.Inject;

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

}
