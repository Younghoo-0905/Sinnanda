package com.b2.Sinnanda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.commons.DL;
import com.b2.Sinnanda.mapper.AdminMapper;
import com.b2.Sinnanda.vo.Admin;
import com.b2.Sinnanda.vo.AdminSales;
import com.b2.Sinnanda.vo.Host;
import com.b2.Sinnanda.vo.Member;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
	@Autowired DL dl;
	
	//[윤경환] 관리자회원가입
	public void addAdmin(Admin admin) {
		log.debug("<----------"+admin);
		adminMapper.insertAdmin(admin);
		
	}
	//[윤경환]관리자 상세 조회
	public Admin getAdminOne(int adminNo) {
		log.debug("adminNo++++++++++++"+adminNo);
		return adminMapper.selectAdminOne(adminNo);
		
	}
	
	//[윤경환] 관리자 수정 전 로그인 
	public Admin getModifyAdmin(String adminId, String adminPw) {
		log.debug("adminId++++++++++++"+adminId);
		log.debug("adminPw++++++++++++"+adminPw);
		
		return adminMapper.modifyAdmin(adminId, adminPw);
	}
	
	//[윤경환] 관리자 수정 
	public void getModifyAdminForm(Admin admin) {
		log.debug("Admin <--------------"+ admin);
		adminMapper.modifyAdminForm(admin);
	}
	
	public Admin getSelectAdminName(int adminNo) {
		log.debug("Admin <--------------"+ adminNo);
		return adminMapper.selectAdminName(adminNo);
	}
	
	
	//[윤경환] 관리자 리스트 조회
	public Map<String, Object> getAdminList(String adminPosition, int currentPage, int rowPerPage){
		
		
		if(adminPosition == null || adminPosition.equals("전체 관리자")) {
			adminPosition = null;
		}
		
		
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("adminPosition", adminPosition);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		List<Admin> adminList =  adminMapper.selectAdminList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = adminMapper.selectAdminTotalCount();
		
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("adminList", adminList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
		
	}
	//[윤경환] 관리자 등급수정 
	public void getmodifyAdminList(Admin admin) {
		adminMapper.modifyAdminList(admin);
	}
	//[윤경환] 관리자 등록시 등급 수정
	public int checkAdminId(String adminId) {
		int checkResult = adminMapper.checkAdminId(adminId);
		return checkResult;
		
	}
	
	//[윤경환] 맴버 리스트 
	public Map<String, Object> getMemberList(int memberActive, int currentPage, int rowPerPage){
		
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("memberActive", memberActive);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		List<Member> memberList =  adminMapper.selectMemberList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = adminMapper.selectMemberTotalCount();
		
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("memberList",memberList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
		
	}
	
	public int getModifyMemberAc(int memberNo) {
		log.debug("memberNo+++++++++++++++"+memberNo);
		return adminMapper.modifyMemberAc(memberNo);
	}
	
	//[윤경환] 호스트 리스트 
	public Map<String, Object> getHostList(int hostActive, int currentPage, int rowPerPage){
		
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("hostActive", hostActive);
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		
		List<Host> hostList =  adminMapper.selectHostList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = adminMapper.selectHostTotalCount();
		
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("hostList",hostList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
		
	}
	
	//[윤경환] 정산 차트 
	public Map<String, Object> getIncomeChart(int year) {
		Map<String, Object>  map = adminMapper.IncomeAdminYear(year);
		return map;
		
	}
	
	//[윤경환] 년도에 따라 회원가입 한 수 
	public Map <String, Object> getTotalMemberYear(int year){
		Map<String, Object>  paraMap = new HashMap<>();
		paraMap.put("map1", adminMapper.TotalMemberYear(year));
		paraMap.put("map2", adminMapper.DeleteMemberYear(year));
		
		dl.p("AdminService", "getTotalMemberYear", paraMap);
		
				
		return paraMap;
	}
	
	//[윤경환] 년도에 따라 탈퇴한 맴버수 
		public Map <String, Object> getDetelMemberYear(int year){
			Map<String, Object>  map = adminMapper.DeleteMemberYear(year);
			return map;
		}
	

}
