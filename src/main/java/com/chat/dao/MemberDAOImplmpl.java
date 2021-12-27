package com.chat.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.chat.vo.Member;


@Repository
public class MemberDAOImplmpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.bbs.mappers.bbs";
	@Override
	public Member login(Member members) throws Exception {
		
		return sqlSession.selectOne(SESSION+".login",members);
	}
	@Override
	public void join(Member members) throws Exception {
		
		sqlSession.insert(SESSION+".join",members);
		
	}
	@Override
	public Member viewMember(String m_id) throws Exception {
		
		return sqlSession.selectOne(SESSION+"viewMember",m_id);
	}
	
	@Override
	public Member readMember(String m_id) throws Exception {
		
				Member vo = sqlSession.selectOne(SESSION+".readMember", m_id);
				return vo;
	}
	
	
	@Override
	public Member readMemberWithIDPW(String userid, String userpw) throws Exception {
	
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("m_id", userid);
		paramMap.put("m_pw", userpw);
		
		return sqlSession.selectOne(SESSION+".readMemberWithIDPW", paramMap);
		
		

	}
	@Override
	public Member findId(String m_id, String m_pw) throws Exception {
		
		return null;
	}
	@Override
	public void changeInfo(Member member) throws Exception {
		
		sqlSession.update(SESSION+"changeInfo",member);
	}
}
