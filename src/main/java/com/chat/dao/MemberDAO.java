package com.chat.dao;

import java.util.List;

import com.chat.vo.Authmail;
import com.chat.vo.Member;

public interface MemberDAO {

	public Member login(Member members) throws Exception;
	public void join(Member member) throws Exception;
	public Member viewMember(String m_id) throws Exception;
	public Member readMember(String userid) throws Exception;
	public Member readMemberWithIDPW(String userid,String userpw) throws Exception;
	public String find_id2(Member member) throws Exception;
	public void changeInfo(Member member) throws Exception;
	public String find_id(Member member) throws Exception;
	public int updatepw(Member member) throws Exception;
	public Integer getAuthnum(String m_email) throws Exception;
	public void setAuthnum(Authmail authmail) throws Exception;
	public void resetAuthnum(Authmail authmail) throws Exception;
	public void deleteAuthmail(String m_email) throws Exception;
	public String idCheck(String m_id) throws Exception;
	public List<Member> memberList() throws Exception;
}
