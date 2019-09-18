package com.bit.UntitledBistro.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.UntitledBistro.model.seobis.Seobis_MemberDTO;
import com.bit.UntitledBistro.service.seobis.Seobis_MemberService;




@Controller
public class Seobis_MemberCheckController {
	
	@Autowired
	private Seobis_MemberService Seobis_memberService;
	
	@RequestMapping(value = "/") //메인 화면
	public String test() {
		return "baseLayout";
	}
	
	@RequestMapping(value = "/Seobis_joinUs") // 회원 관리 메뉴를 누르면 이동하는 맵핑
	public String seobis_formstart() {
		return "seobis/Seobis_form";
	}
	
	@RequestMapping(value="/Seobis_jUs")  //회원 관리창에서 회원 등록으로 보내는 맵핑
	public String seobis_formadd() {
	return "seobis/Seobis_joinUs";
	}
	
	@RequestMapping(value="/Seobis_del")
	public String seobis_formdelete() {
		return "seobis/Seobis_delete";
	}
	
	@RequestMapping(value="/Seobis_createMember", method = RequestMethod.POST)  //회원 가입을 처리하는 맵핑
	public String seobis_joinUsSubmit (HttpSession session, Seobis_MemberDTO seobis_MemberDTO_dto) {
		String view = null;
		
		Seobis_memberService.Seobis_MemberInsert(seobis_MemberDTO_dto);
		
		if(seobis_MemberDTO_dto != null) {
			session.setAttribute("USERNAME", seobis_MemberDTO_dto.getMember_id());
			view = "seobis/Seobis_success";
		} else {
			view = "seobis/Seobis_fail";
		}
		return view;
	}
	
	@RequestMapping(value="/Seobis_mList")  //회원 목록을 처리하는 맵핑
	public String seobis_memberList(HttpServletRequest request, HashMap<String, Object> map) {
		int pg=1;
		String strPg = request.getParameter("pg"); 
		if(strPg!=null){
			pg = Integer.parseInt(strPg);			
		}
		int rowSize = 10;
		int start = (pg*rowSize)-(rowSize -1);
		int end = pg*rowSize;
		
		int total = Seobis_memberService.Seobis_MemberListCount(); //총 게시물수
		System.out.println("시작 : "+start +" 끝:"+end);
		System.out.println("글의 수 : "+total);
		
		int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		//int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : "+ allPage);
		
		int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		//((1-1)/10*10)
		int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		if(toPage> allPage){ // 예) 20>17
			toPage = allPage;
		}
		
		map.put("start", start);
		map.put("end", end);
		
		List<Seobis_MemberDTO> Seobis_memberList = Seobis_memberService.Seobis_MemberList(map);
		request.setAttribute("Seobis_memberList", Seobis_memberList);
		request.setAttribute("pg",pg);
		request.setAttribute("allPage",allPage);
		request.setAttribute("block",block);
		request.setAttribute("fromPage",fromPage);
		request.setAttribute("toPage",toPage);	
		
		return "seobis/Seobis_memberList"; //.jsp
	}
	
	@RequestMapping(value="")
	public String Seobis_memberdelete(Seobis_MemberDTO seobis_MemberDTO_dto, int pg) {
		int result = Seobis_memberService.Seobis_MemberDelete(seobis_MemberDTO_dto);
		String res = "seobis/Seobis_memberList?pg="+pg;
		if(result == 0) {
			res = "seobis/Seobis_fail";
		}
		return res;
	}
	
}
