package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.BoardServiceImpl;


@Controller
public class BoardController {
	
//	BoardService boardService = new BoardServiceImpl() 객체 생성
	@Inject
	private BoardService boardService;
	
	//업로드될 폴더 경로
	@Resource(name= "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String insert(){
		return "board/writeForm";
	}
	@RequestMapping(value = "/board/writePro", method = RequestMethod.POST)
	public String insertPro(BoardDTO boardDTO){
		System.out.println("BoardController insertPro");
		boardService.insertBoard(boardDTO);
		return "redirect:/board/list";
	}
	   
	
	@RequestMapping(value = "/board/fwrite", method = RequestMethod.GET)
	public String finsert(){
		return "board/fwriteForm";
	}
	@RequestMapping(value = "/board/fwritePro", method = RequestMethod.POST)
	public String finsertPro(HttpServletRequest request, MultipartFile file) throws Exception{
		System.out.println("BoardController finsertPro");
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setName(request.getParameter("name"));
		boardDTO.setPass(request.getParameter("pass"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		//파일 업로드
		//파일이름 랜덤문자_파일이름
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString()+"_"+file.getOriginalFilename();
		System.out.println(fileName);
		//업로드 파일을 복사해서 => upload 폴더에 넣기
		File targetFile = new File(uploadPath,fileName);
		FileCopyUtils.copy(file.getBytes(), targetFile);
		//BoardDTO 파일 이름 저장
		
		boardDTO.setFile(fileName);
		boardService.insertBoard(boardDTO);
		return "redirect:/board/list";
	}
}
