package com.b2.Sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.AdminSales;
import com.b2.Sinnanda.vo.Host;
import com.b2.Sinnanda.vo.Member;

@Mapper
public interface AdminMapper {
	//[윤경환] 관리자회원가입
	int insertAdmin(Admin admin);
	
	
	//[윤경환] 관리자 세부정보
	Admin selectAdminOne(int adminNo);
	
	//[윤경환] 관리자 회원정보 수정으로 이동 
	Admin modifyAdmin(String adminId, String adminPw);
	
	//[윤경환] 관리자 회원정보 수정 
	int modifyAdminForm(Admin admin);

	//[윤경환] 관리자 정보 
	Admin selectAdminName(int adminNo);
	
	//[윤경환] 관리자 목록 조회 페이징 사용 
	List<Admin> selectAdminList(Map<String, Object> map);
	
	//[윤경화] 관리자 총 수 
	int selectAdminTotalCount(String adminPosition);
	
	//[윤경환] 관리자 등급 수정 	
	int modifyAdminList(Admin admin);
	
	//[윤경환] 관리자 아이디 중복 체크 
	int checkAdminId(String adminId);
	
	
	//[윤경환] 맴버 리스트 조회 
	 List<Member> selectMemberList(Map<String, Object> map);

	 // [윤경화] 멤버 총 수 
	int selectMemberTotalCount(int memberActive);
	
	//[윤경환] 멤버 활성화
	int modifyMemberAc(int memberNo);
	
	
	int modifyHostAc(int hostNo); 
	
	//[윤경환] 호스트 리스트 
	List<Host> selectHostList(Map<String, Object> map);
	
	//[윤경환] 호스트 총수 
	int selectHostTotalCount(int hostActive);
	
	
	//[윤경환] 관리자 정산 차트 
 	Map<String,Object> IncomeAdminYear(int year);
 	
 	//[윤경환] 회원 년도에 따라 회원가입 한 맴버 
 	Map<String,Object> TotalMemberYear(int year);
 	
 	//[윤경환] 탈퇴한 회원수 
 	Map<String,Object> DeleteMemberYear(int year);
	
 	//[윤경환] 회원가입한 사업자 차트 
 	Map<String,Object> TotalHostYear(int year);
 	
 	//[윤경환] 날짜에 따른 숙소 종류 수 
 	Map<String,Object> TotalAccomYear(int year, String accomName);

}
