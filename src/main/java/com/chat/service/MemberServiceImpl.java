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
	public Member findId(String m_id, String m_email) throws Exception {
		dao.findId(m_id,m_email);
		return null;
	}

	@Override
	public void infoChange(Member member) throws Exception {
		dao.changeInfo(member);
		
	}

}
