package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.AddressMapper;
import com.b2.Sinnanda.mapper.MemberAddressMapper;
import com.b2.Sinnanda.mapper.MemberMapper;
import com.b2.Sinnanda.vo.Address;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Complain;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;
import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.Reserve;
import com.b2.Sinnanda.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MemberService {
	
	@Autowired MemberMapper memberMapper;
	@Autowired MemberAddressMapper memberAddressMapper;
	@Autowired AddressMapper addressMapper;
	@Autowired DL dl;
		
	//	[김영후]	member 휴면계정 해제
	public void activeMember(int memberNo){
		memberMapper.activeMember(memberNo);
	}
	
	//	[김영후]	(스케쥴러) 1년 이상 미접속 계정 휴면 변경
	public int modifyMemberActive() {
		return memberMapper.modifyMemberActive();
	}
	
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
		
		// "전체"의 카테고리를 조회하는 경우, null 값으로 변경 -> 쿼리에서 WHERE절이 실행되지 않도록 한다 (by 김영후)
		if(qnaCategory == null || qnaCategory.equals("전체")) {
			qnaCategory = null;
		}
		
		// 매개변수 가공 (paraMap <-- qnaCategory, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		
		// 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * rowPerPage) - rowPerPage;		

		// 10개의 페이지번호의를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		dl.p("qnaList()", "pageNo", pageNo);
		
		paraMap.put("memberNo", memberNo);
		paraMap.put("qnaCategory", qnaCategory);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		// 2. qna 리스트 조회
		List<Qna> myQnaList = memberMapper.selectMyQnaListQnaCategory(paraMap);
		dl.p("MemberService", "getMyQnaListByQnaCategory()", "myQnaList : "+myQnaList.toString());
		// 3. 리턴 값 가공 (return : qna & lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = memberMapper.selectMyQnaTotalCount(paraMap);
		log.debug(" ├[param] totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0 || lastPage == 0) {
			lastPage += 1;
		}
		
		log.debug(" ├[param] lastPage : "+lastPage);
		returnMap.put("myQnaList", myQnaList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("beginRow", beginRow);
		returnMap.put("pageNo", pageNo);
		
		return returnMap;
	}
	
	// [유동진] 내가 작성한 리뷰 목록 조회
	public Map<String, Object> getMyReviewListByReviewRecommend(int memberNo, String reviewRecommend, int currentPage, int rowPerPage){
		dl.p("MemberService", "getMyReviewListByReviewRecommend()", "나의 리뷰 목록");
		dl.p("MemberService", "getMyReviewListByReviewRecommend()", "memberNo : "+memberNo);
		dl.p("MemberService", "getMyReviewListByReviewRecommend()", "reviewRecommend : "+reviewRecommend);
		dl.p("MemberService", "getMyReviewListByReviewRecommend()", "currentPage : "+currentPage);
		dl.p("MemberService", "getMyReviewListByReviewRecommend()", "rowPerPage : "+rowPerPage);
		
		// 1. 매개변수 가공 (paraMap <-- reviewRecommend, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("memberNo", memberNo);
		paraMap.put("reviewRecommend", reviewRecommend);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		// 2. review 리스트 조회
		List<Review> myReviewList = memberMapper.selectMyReviewListReviewRecommend(paraMap);
		dl.p("MemberService", "getMyReviewListByReviewRecommend()", "myReviewList : "+myReviewList.toString());
		// 3. 리턴 값 가공 (return : review & lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = memberMapper.selectMyReviewTotalCount(reviewRecommend);
		dl.p("MemberService", "getMyReviewListByReviewRecommend()", "totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		dl.p("MemberService", "getMyReviewListByReviewRecommend()", "lastPage : "+lastPage);
		returnMap.put("myReviewList", myReviewList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	// [유동진] 회원 예약내역 조회
	public Map<String, Object> getMyReserveList(int memberNo, String reserveUse, int currentPage, int rowPerPage) {
		dl.p("MemberService", "getMyReserveList()", "예약내역 조회");
		dl.p("MemberService", "getMyReserveList()", "memberNo : "+memberNo);
		dl.p("MemberService", "getMyReserveList()", "reserveUse : "+reserveUse);
		dl.p("MemberService", "getMyReserveList()", "currentPage : "+currentPage);
		dl.p("MemberService", "getMyReserveList()", "rowPerPage : "+rowPerPage);
		
		// 1. 매개변수 가공 (paraMap <-- qnaCategory, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("memberNo", memberNo);
		paraMap.put("reserveUse", reserveUse);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		// 2. 예약내역 조회
		List<Reserve> myReserveList = memberMapper.selectMyReserveList(paraMap);
		dl.p("MemberService", "getMyReserveList()", "myReserveList : "+myReserveList.toString());
		// 3. 리턴 값 가공 (return : reserve & lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = memberMapper.selectMyReserveTotalCount(reserveUse);
		dl.p("MemberService", "getMyReserveList()", "totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		dl.p("MemberService", "getMyReserveList()", "lastPage : "+lastPage);
		returnMap.put("myReserveList", myReserveList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	// [유동진] 예약내역 상세 조회
	public Reserve getMyReserveOne(int reserveNo) {
		dl.p("MemberService", "getMyReserveOne()", "예약내역 상세보기");
		dl.p("MemberService", "getMyReserveOne()", "reserveNo : "+reserveNo);
		
		return memberMapper.selectMyReserveOne(reserveNo);
	}
	
	// [유동진] 내가 작성한 컴플레인 목록 조회
	public Map<String, Object> getMyComplainList(int memberNo, String complainCategory, int currentPage, int rowPerPage){
		dl.p("MemberService", "getMyComplainList()", "내가 작성한 컴플레인 시작");
		dl.p("MemberService", "getMyComplainList()", "memberNo : "+memberNo);
		dl.p("MemberService", "getMyComplainList()", "complainCategory : "+complainCategory);
		dl.p("MemberService", "getMyComplainList()", "currentPage : "+currentPage);
		dl.p("MemberService", "getMyComplainList()", "rowPerPage : "+rowPerPage);
		
		// 1. 매개변수 가공 (paraMap <-- complainCategory, currentPage, rowPerPage)
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("memberNo", memberNo);
		paraMap.put("complainCategory", complainCategory);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		// 2. qna 리스트 조회
		List<Complain> myComplainList = memberMapper.selectMyComplainList(paraMap);
		dl.p("MemberService", "getMyQnaListByQnaCategory()", "myComplainList : "+myComplainList.toString());
		// 3. 리턴 값 가공 (return : complain & lastPage)
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = memberMapper.selectMyComplainTotalCount(complainCategory);
		dl.p("MemberService", "getMyComplainList()", "totalCount : "+totalCount);
		
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		dl.p("MemberService", "getMyComplainList()", "lastPage : "+lastPage);
		returnMap.put("myComplainList", myComplainList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	// [유동진] 컴플레인 상세 조회
	public Complain getMyComplainOne(int complainNo) {
		dl.p("MemberService", "getMyComplainOne()", "컴플레인 상세보기");
		dl.p("MemberService", "getMyComplainOne()", "complainNo : "+complainNo);
		
		return memberMapper.selectMyComplainOne(complainNo);
	}

	//	[김영후] 회원 이메일 인증
	public int certifyMember(Member member) {
		int result = memberMapper.certifyMember(member);
		return result;
	}
	public void certifyMemberUpdate(Member member) {
		memberMapper.certifyMemberUpdate(member);
	}
	
	//	[김영후, 이승준(수정)] 회원 가입
	public void addMember(Member member) {
		dl.p("MemberService", "addMember()", "[시작]");
		dl.p("addMember()", "member", member);
		
		// 0. 회원 이메일 인증코드 생성
		member.setMemberCertifycode(UUID.randomUUID().toString());
		// 1. 회원 정보 추가 ( member_level = 0 비활성화 상태 )
		memberMapper.insertMember(member);
		
		// 2. 입력받은 긴 주소를 분리 (ㅁㅁ시 ㅁㅁ구 ㅁㅁ로 12-34 -> [(ㅁㅁ시), (ㅁㅁ구), (ㅁㅁ로), (12-34)])
		String[] addressArr = new String[5];
		addressArr = member.getMemberAddress().getAddressInfo().split(" ");
		
		// 3. 시도, 시군구, 도로명 파라미터 설정
		Address paraAddress = new Address();
			paraAddress.setSido(addressArr[0]);
			paraAddress.setSigungu(addressArr[1]);
			paraAddress.setRoadName(addressArr[2]);
		
		// 4. 지번이 있는 경우, 지번 파라미터 설정
		if(addressArr.length >= 4) {
			String jibuns[] = new String[2];
			
			// 4-1. 지번 분리
			jibuns = addressArr[3].split("-");
			dl.p("getAddressOne()", "jibuns.length", jibuns.length);
					
			// 4-2. 메인지번 파라미터 설정
			paraAddress.setMainBuildingCode(Integer.parseInt(jibuns[0]));
			
			// 4-3. 서브지번이 있는 경우, 파라미터 설정
			if(jibuns.length == 2) {
				paraAddress.setSubBuildingCode(Integer.parseInt(jibuns[1]));
			}
		}
		
		// 5. 입력받은 주소에 해당되는 주소번호 조회
		Address returnAddress = addressMapper.selectAddressOne(paraAddress);
		
		// 6. 회원주소를 삽입하기 위한 가공
		member.getMemberAddress().setMemberNo(member.getMemberNo());
		member.getMemberAddress().setAddressNo(returnAddress.getAddressNo());
		
		// 7. 회원주소 삽입
		memberAddressMapper.insertMemberAddress(member.getMemberAddress());
		
	}
	
	//	[김영후] 로그인 시 이메일 인증 여부 확인
	public int getCertifyMember(Member member) {
		int memberActive = memberMapper.selectCertifyMember(member);
		return memberActive;
		
	}
	
	//	[김영후, 유동진] 회원 탈퇴
	public void removeMember(Member member) {
		memberMapper.deleteMember(member);
	}	
	
	// [이승준, 유동진] 회원탈퇴시 Pw 일치여부 체크
	public int checkPw(int memberNo, String memberPw) {
		Member member = new Member();
		
		member.setMemberNo(memberNo);
		member.setMemberPw(memberPw);
		
		int checkResult = memberMapper.checkPw(member);
		
		return checkResult;
	}
	
	//	[김영후] 회원 가입 시 ID 중복체크
	public int checkId(String memberId) {
		int checkResult = memberMapper.checkId(memberId);
		return checkResult;
	}
}
