package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.mapper.MemberMapper;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;
import com.b2.Sinnanda.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MemberService {
	
	@Autowired MemberMapper memberMapper;
	
	// [유동진] 마이페이지
	public Member myPage(int memberNo) {
		return memberMapper.selectMyPage(memberNo);		
	}
	
	// [유동진] 회원 정보 수정
	public void modifyMember(Member member) {
		memberMapper.updateMember(member);
	}
	
	// [유동진] 회원 비밀번호 변경전 현재 비밀번호 확인
	public Member getNowMemberPw(int memberNo) {
		return memberMapper.selectNowMemberPw(memberNo);
	}
	
	// [유동진] 회원의 현재 비밀번호 불러오기 
	public Member getCheckMemberPw(String memberPw) {	
		return memberMapper.selectMemberPw(memberPw);
	}
	
	// [유동진] 비밀번호 변경
	public void modifyMemberPw(Member member) {
		memberMapper.updateMemberPw(member);
	}
	
	// [유동진] My QnA 상세 조회
	public Qna getMyQnaOne(int qnaNo) {
		log.debug("[Debug] \"START\" MemberService.getMyQnaOne()");
		log.debug(" ├[param] qnaNo : "+qnaNo);
		
		return memberMapper.selectMyQnaOne(qnaNo);
	}
	
	// [유동진] 내가 작성한 QnA 목록 조회
	public Map<String, Object> getMyQnaListByQnaCategory(int memberNo, String qnaCategory, int currentPage, int rowPerPage){
		log.debug("[Debug] \"START\" MemberService.getMyQnaList()");
		log.debug(" ├[param] memberNo : "+memberNo);
		log.debug(" ├[param] qnaCategory : "+qnaCategory);
		log.debug(" ├[param] currentPage : "+currentPage);
		log.debug(" ├[param] rowPerPage : "+rowPerPage);
		
		// 1. 매개변수 가공 (paraMap <-- qnaCategory, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("memberNo", memberNo);
		paraMap.put("qnaCategory", qnaCategory);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		// 2. qna 리스트 조회
		List<Qna> myQnaList = memberMapper.selectMyQnaListQnaCategory(paraMap);
		log.debug(" ├[param] myQnaList : "+myQnaList.toString());
		// 3. 리턴 값 가공 (return : qna & lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = memberMapper.selectMyQnaTotalCount(qnaCategory);
		log.debug(" ├[param] totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		log.debug(" ├[param] lastPage : "+lastPage);
		returnMap.put("myQnaList", myQnaList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	//	[김영후] 회원 이메일 인증
	public int certifyMember(Member member) {
		int result = memberMapper.certifyMember(member);
		return result;
	}
	public void certifyMemberUpdate(Member member) {
		memberMapper.certifyMemberUpdate(member);
	}
	
	//	[김영후] 회원 가입
	public void addMember(Member member) {

		//	이메일 인증코드 생성
		member.setMemberCertifycode(UUID.randomUUID().toString());
		//	회원 정보 추가 ( member_level = 0 비활성화 상태 )
		memberMapper.insertMember(member);
	}
	
	//	[김영후] 로그인 시 이메일 인증 여부 확인
	public int getCertifyMember(Member member) {
		int memberActive = memberMapper.selectCertifyMember(member);
		return memberActive;
		
	}
	
	//	[김영후] 회원 탈퇴
	public void removeMember(Member member, MemberOut memberOut) {
		memberMapper.deleteMember(member);
		memberMapper.insertMemberOut(memberOut);
	}	
	
	//	[김영후] 회원 가입 시 ID 중복체크
	public int checkId(String memberId) {
		int checkResult = memberMapper.checkId(memberId);
		return checkResult;
	}
}
