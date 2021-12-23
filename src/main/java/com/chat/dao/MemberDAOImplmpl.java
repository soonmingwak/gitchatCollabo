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
		
		
	//테스트(컨트롤러) 호출 -> 정보를 저장 -> DB로이동
		
		//String인자를 2개를 가져갈 수 없기때문에 파라미터 두개를 객체인 Map에 넣어서 가지고 넘긴다
		//return sqlSession.selectOne(namespace+".readMemberWithIDPW", userid, userpw);		
		
		// DB로 정보를 전달하기 위해서는 sqlSeesion 객체 활용
		// * 1개 이상의 정보를 전달할때는 객체 단위로 전달
		// * 객체(VO) 안에 저장이 안되는 정보의 경우 Map을 사용
		// Map은 key-value형태 : 이때 key값은 sql구문의 #{ㅇㅇㅇ} 이름과 같아야함
	}
	@Override
	public Member findId(String m_id, String m_pw) throws Exception {
		
		return null;
	}
}
