package com.b2.Sinnanda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.Sinnanda.vo.Member;

@Service
@Transactional
public class CertifyEmailService {
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendMail(Member member) {		
				
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo(member.getMemberEmail());
		
		simpleMessage.setSubject("'Sinnanda' 회원가입 인증");
		
		simpleMessage.setText("인증 코드 : " + member.getMemberCertifycode());
		
		javaMailSender.send(simpleMessage);
	}
}
