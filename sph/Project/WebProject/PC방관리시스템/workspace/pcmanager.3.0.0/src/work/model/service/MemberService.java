package work.model.service;

import java.util.ArrayList;

import work.model.dao.MemberDao;
import work.model.dto.Member;

/**
 * 회원관리를 위한 기능(crud)이 모델링된 서비스 클래스
 */
public class MemberService {
	// Member 테이블 DAO 하기위한 객체 생성
	//private MemberDao dao = new MemberDao();
			
	// Singleton Pattern 적용 설계 사용 변경
	private MemberDao dao = MemberDao.getInstance();
	
	/** 등록회원수 조회 메서드 */
	public int getCount() {
		return 0;
	}
	
	/**
	 * 회원 아이디 존재 유무 및 저장위치 조회 메서드
	 */
	public boolean isExist(String memberId) {
		return false;
	}
	
	/**
	 * 회원 등록
	 */
	public int addMember(Member dto) {
		return dao.insert(dto);
	}
	
	
	/**
	 * 회원 정보 조회
	 */
	public Member getMember(String memberId) {
		return dao.selectOne(memberId);
	}
	
	/**
	 * 내정보 변경
	 */
	public int updateMember(Member dto) {
		return dao.update(dto);
	}
	
	/**
	 * 암호변경
	 */
	public void updateMemberPw(String memberId, String memberPw, String modifyMemberPw) {
	}
	
	/**
	 * 회원탈퇴
	 */
	public int deleteMember(String memberId) {
		return dao.delete(memberId);
	}
	
	/**
	 * 전체회원 조회
	 */
	public ArrayList<Member> getMember() {
		return dao.selectList();
	}
	
	public ArrayList<Member> getMemberGrade(String grade) {
		return dao.selectList(grade);
	}
	
}












