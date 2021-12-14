package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxTestController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="/test/ajaxtest1",method=RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		// /member/idCheck?id=값
		String id=request.getParameter("id");
		MemberDTO memberDTO = memberService.getMember(id);
		String result="";
		if(memberDTO==null) {
			result="idok"; //아이디 없음 아이디 사용가능
		}else {
			result="iddup"; //아이디 있음 아이디 중복
		}
		
		ResponseEntity<String> entity=new ResponseEntity<String>(result, HttpStatus.OK);
		
		//데이터 담아서 ajax호출한 곳으로 리턴 
		return entity;
	}
	@RequestMapping(value="/test/ajaxtest2",method=RequestMethod.GET)
	public ResponseEntity<String> emailCheck(HttpServletRequest request) {
		String result = "";
		String email = request.getParameter("email");
		
		MemberDTO memberDTO = memberService.getMemberEmail(email);
		if(memberDTO==null) {
			result="emailok"; //아이디 없음 아이디 사용가능
		}else {
			result="emaildup"; //아이디 있음 아이디 중복
		}
		ResponseEntity<String> entity=new ResponseEntity<String>(result, HttpStatus.OK);
		
		//데이터 담아서 ajax호출한 곳으로 리턴 
		return entity;
	}
	//회원목록
	@RequestMapping(value="/test/ajaxtest3",method=RequestMethod.GET)
	public ResponseEntity<List<MemberDTO>> list(HttpServletRequest request) {
		
		List<MemberDTO> memberList = memberService.getMemberList();
			
		ResponseEntity<List<MemberDTO>> entity = new ResponseEntity<List<MemberDTO>>(memberList, HttpStatus.OK);
			
		//memberList => 자동으로 JSON으로 변경하는 프로그램 설치
			
		//데이터 담아서 ajax호출한 곳으로 리턴 
		return entity;
	}
	
}
