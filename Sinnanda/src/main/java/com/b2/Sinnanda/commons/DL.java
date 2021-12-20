package com.b2.Sinnanda.commons;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class DL {
//[이원희] 디버깅용 클래스
	public void p(String Cname,String Vname, Object value){
		String space = "";
		for(int s = 0;s<=(79-Cname.length());s++) {
			space += " ";
		}
		log.debug("┌──────────────────────────────────────────────────────────────────────────────────────────────────┐");
		log.debug("│호출/저장위치 :	{}",Cname+space+"│");
		log.debug("├──────────────────────────────────────────────────────────────────────────────────────────────────┤");
		space="";
		for(int s = 0;s<=(79-Vname.length());s++) {
			space += " ";
		}
		log.debug("│메소드/변수명 :	{}",Vname+space+"│");
		log.debug("├──────────────────────────────────────────────────────────────────────────────────────────────────┤");
		space="";
		String sortV=""+value; 
		if(79<=sortV.length()) {
			String[] array = sortV.toString().split(",");
			for(int s1 = 0; s1<=(79-array[0].length());s1++){
				space += " ";
			}
			log.debug("│반환값/값내용 :      	"
					+ "{}",array[0]+space+"│");
			
			
			for(int s2 = 1;s2<array.length;s2++) {
				log.debug("│\t\t\t"+array[s2]);
			}
			
		}else if(sortV.length()<79) {
			for(int s3 = 0; s3<=(79-sortV.length());s3++){
				space += " ";
			}
			log.debug("│반환값/값내용 :	"
					+ "{}",sortV+space);
		}
		log.debug("└──────────────────────────────────────────────────────────────────────────────────────────────────┘");
	}
}
