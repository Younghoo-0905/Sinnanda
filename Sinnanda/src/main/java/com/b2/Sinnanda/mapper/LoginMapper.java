package com.b2.Sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.Sinnanda.vo.Member;

@Mapper
public interface LoginMapper {
	public Member login(Member member);
}
