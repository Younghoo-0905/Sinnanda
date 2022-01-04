package com.b2.Sinnanda.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.Complain;
import com.b2.Sinnanda.vo.Member;
import com.b2.Sinnanda.vo.MemberOut;
import com.b2.Sinnanda.vo.Qna;
import com.b2.Sinnanda.vo.Reserve;
import com.b2.Sinnanda.vo.Review;


@Mapper
public interface MemberMapper {
	
	// [이승준] 회원 상세+주소 조회
	Member selectMemberOneWithAddress(int memberNo);
	
	//	[김영후]	member 휴면계정 해제
	void activeMember(int memberNo);
	
	//	[김영후]	(스케쥴러) 1년 이상 미접속 계정 휴면 변경
	int modifyMemberActive();
	
	// [유동진] 마이페이지
	Member selectMyPage(int memberNo);
		
	// [유동진] 회원 정보 수정
	int updateMember(Member member);
	
	// [유동진] 회원 비밀번호 변경전 현재 비밀번호 확인
	Member selectNowMemberPw(int memberNo);
	
	// [유동진] 회원의 현재 비밀번호 불러오기
	Member selectMemberPw(String memberPw);
	
	// [유동진] 회원 비밀번호 변경
	int updateMemberPw(Member member);
	
	// [유동진] QnA 상세 조회
	Qna selectMyQnaOne(int qnaNo);
		
	// [유동진] 내가 작성한 QnA 목록 조회
		/* 매개변수 : 페이징을 위한 "qnaCategory, beginRow, rowPerPage" */
	List<Qna> selectMyQnaListQnaCategory(Map<String, Object> map);
	
	// [유동진] 내가 작성한 QnA의 총 갯수 조회
	int selectMyQnaTotalCount(Map<String, Object> map);
	
	// [유동진] 내가 작성한 리뷰 목록 조회
		/* 매개변수 : 페이징을 위한 "reviewRecommend", "beginRow, rowPerPage" */
	List<Review> selectMyReviewListReviewRecommend(Map<String, Object> map);
	
	// [유동진] 내가 작성한 리뷰의 총 갯수 조회
	int selectMyReviewTotalCount(Map<String, Object> map);
	
	// [유동진] 나의 예약내역 조회
	List<Reserve> selectMyReserveList(Map<String, Object> map);
	
	// [유동진] 예약내역 총 갯수 조회
	int selectMyReserveTotalCount(Map<String, Object> map);
	
	// [유동진] 예약내역 상세 조회
	Reserve selectMyReserveOne(int reserveNo);
	
	// [유동진] 내가 작성한 컴플레인 목록 조회
	List<Complain> selectMyComplainList(Map<String, Object> map);
	
	// [유동진] 내가 작성한 컴플레인 갯수 조회
	int selectMyComplainTotalCount(Map<String, Object> map);
	
	// [유동진] 내가 작성한 컴플레인 상세조회
	Complain selectMyComplainOne(int complainNo);
	
	// [유동진] 결제 금액 조회
	Map<String,Object> memberPaymentYear(int year, int memberNo);
	
	// [유동진] 년도별 이용 횟수
	Map<String,Object> memberUseYear(int year, int memberNo);
	
	//	[김영후] 회원 가입
	int insertMember(Member member);
	
	//	[김영후] 회원 이메일 인증		21.12.10
	int certifyMember(Member member);
	int certifyMemberUpdate(Member member);
	int selectCertifyMember(Member member);
	
	//	[김영후, 유동진] 회원 탈퇴
	int deleteMember(Member member);
	
	// [유동진, 이승준] 회원 탈퇴시 Pw 일치여부 체크
	int checkPw(Member member);
	
	//	[김영후] 회원 가입 시 ID 중복체크
	int checkId(String memberId);
}
