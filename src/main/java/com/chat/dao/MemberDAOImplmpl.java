package com.chat.dao;

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

}
