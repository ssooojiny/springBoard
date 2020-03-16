package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.servcie.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	 @Inject
	 private BoardService service;
	
	 // 게시물 리스트
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getList(Model model) throws Exception {
	  
	  List<BoardVO> list = null;
	  list = service.list();
	  model.addAttribute("list", list);
	 }
	 
	 //게시물작성 GET
	 @RequestMapping(value="/write", method=RequestMethod.GET)
	 public void getWrite() throws Exception {
		 
	 }
	 
	 // 게시물 작성 POST
	 @RequestMapping(value="/write", method=RequestMethod.POST)
	 public String getWrite(BoardVO vo) throws Exception {
		 service.write(vo);
		 return "redirect:/board/list";
	 }
	 
	//게시물 조회 GET
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO vo = service.view(bno);
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		 BoardVO vo = service.view(bno);
		 model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {
		 service.modify(vo);
		 return "redirect:/board/view?bno=" + vo.getBno();
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, Model model) throws Exception {
		model.addAttribute("delete",bno);
	}
	
	// 게시물 삭제 POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("bno") int bno) throws Exception {
		service.delete(bno);  
		return "redirect:/board/listPage?num=1";
	}
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception { // num : 페이지 번호
	 
	 // 1. 게시물 총 갯수
	 int count = service.count();
	  
	 // 2. 한 페이지에 출력할 게시물 갯수
	 int postNum = 10;
	  
	 // 3. 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림) <- 소수점은 올림
	 int pageNum = (int)Math.ceil((double)count/postNum);
	  
	 // 4. 출력할 게시물
	 int displayPost = (num - 1) * postNum;
	 
	 // 5. 한번에 표시할 페이징 번호의 갯수
	 int pageNum_cnt = 10;

	 // 6. 표시되는 페이지 번호 중 마지막 번호
	 int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);

	 // 7. 표시되는 페이지 번호 중 첫번째 번호
	 int startPageNum = endPageNum - (pageNum_cnt - 1);
	 
	 // 마지막 페이지 구하는 공식! = ((올림)(현재페이지번호 / 한 번에 표시할 페이지 번호 갯수)) * 한 번에 표시할 페이지 번호의 갯수
	 // 현재 페이지 번호가 8이라면, 한 번에 표시할 페이지 번호의 갯수인 10으로 나눠서
	 // 8 /10 = 0.8로 올림처리하면 1 -> 1을 한번에 표시할 페이지 번호의 갯수인 10을 곱하면 10
	 // 현재 페이지 번호가 41이라면, 한 번에 표시할 페이지 번호의 갯수인 10으로 나눠서
	 // 41 /10 = 4.1 소수점 올림처리하면 5 => 5를 한 번에 표시할 갯수인 10을 곱하면 50 
	 // 마지막 페이지 번호에서 한 번에 표시할 번호의 갯수를 빼면 ex) 마지막 페이지가 10일경우 0 에다가 +1 하면 시작페이지
	 // 시작페이지 구하는 공식 = 마지막 페이지 번호 - 한 번에 표시할 페이지 번호의 갯수 +1
	 
	// 마지막 번호 재계산
	 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
	  
	 if(endPageNum > endPageNum_tmp) {
	  endPageNum = endPageNum_tmp;
	 }
	 /* 
	  재개산 하는 이유 :
	  마지막 페이지 구하는 공식에서 게시물 갯수가 112개면 하단에는 1~10, 10~20 페이지가 표시되는데
	  13페이지부터 20페이지까지 없어도 되는 페이지번호가 출력이 됨
	  여기서 게시물 총 갯수와 한 번에 표시될 페이지 번호의 갯수를 이용해서 재계산 하면
	  112 / 10 => (올림)11.2 => 12 가 됨
	  
	  ===> 이 둘을 비교해서 만약 1차 계산이 크다면 2차로 계산한 값을 넣어줌 (20 > 12)
	  */
	 
	 boolean prev = startPageNum == 1 ? false : true;
	 boolean next = endPageNum * pageNum_cnt >= count ? false : true;
	 
	 List<BoardVO> list = null; 
	 list = service.listPage(displayPost, postNum);
	 model.addAttribute("list", list);   
	 model.addAttribute("pageNum", pageNum);
	 
	// 시작 및 끝 번호
	 model.addAttribute("startPageNum", startPageNum);
	 model.addAttribute("endPageNum", endPageNum);

	 // 이전 및 다음 
	 model.addAttribute("prev", prev);
	 model.addAttribute("next", next);
	 
	// 현재 페이지
	 model.addAttribute("select", num);
	}
	
	
	

}