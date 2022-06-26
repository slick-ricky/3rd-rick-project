package com.cafe.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe.domain.BoardVO;
import com.cafe.domain.PageMaker;
import com.cafe.domain.SearchCriteria;
import com.cafe.persistence.BoardDAO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardDAO dao;
	
	@GetMapping("/create")
	public void writeGet() throws Exception {
		logger.info("write get==================");
	}
	
	@PostMapping("/create")
	public String writePost(BoardVO vo, HttpSession session, @RequestParam (value="code") String code) throws Exception {
		logger.info("write post=================");
		logger.info("code===================="+code);
		
		String session_names = (String)session.getAttribute("names");
		String session_id = (String)session.getAttribute("id");
		logger.info("session_name ===================="+session_names);
		logger.info("session_name ===================="+session_id);
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String signdate = s.format(now);
		
		vo.setCode(code);
		vo.setSigndate(signdate);
		vo.setNames(session_names);
		vo.setId(session_id);
		dao.create(vo);
		
		return "redirect:/board/list?code="+code+"";
	}
	
	@GetMapping("/list")
	public void listGet(BoardVO vo, @ModelAttribute("cri") SearchCriteria cri, Model model, @RequestParam(value="code") String code) throws Exception {
		logger.info("list get......................");	
		logger.info("code========================="+code);
		
		cri.setCode(code);
		
		PageMaker pageMaker = new PageMaker();
		logger.info("pageMaker===================="+pageMaker.toString());
		
//		model.addAttribute("list", dao.listCriteria(cri));
		model.addAttribute("list", dao.listSearch(cri));
		
//		logger.info("--"+cri.getSearchType()+"---"+cri.getKeyword());
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(dao.countPaging(cri)); //sql 카운트 처리
		pageMaker.setTotalCount(dao.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		vo.setCode(code);
		logger.info("code==============="+vo.toString());
		model.addAttribute("list_top", dao.list2(vo));
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void view(BoardVO vo, @RequestParam("uid") int uid, @ModelAttribute("cri") SearchCriteria cri, Model model, @RequestParam(value="code") String code) throws Exception {
		logger.info("view get ...........");
		logger.info("code====================="+code);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		model.addAttribute("pageMaker", pageMaker);
		
		vo.setCode(code);
		vo.setUid(uid);
		
		model.addAttribute("view", dao.view(vo));
		
		model.addAttribute("previous", dao.previous(vo));
		model.addAttribute("next", dao.next(vo));
	}
	
	@RequestMapping(value = "/view2", method = RequestMethod.GET)
	public void view2(BoardVO vo, @RequestParam("uid") int uid, @ModelAttribute("cri") SearchCriteria cri, Model model, @RequestParam(value="code") String code) throws Exception {
		logger.info("view2 get ...........");
		logger.info("code====================="+code);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		model.addAttribute("pageMaker", pageMaker);
		
		vo.setCode(code);
		vo.setUid(uid);
		
		model.addAttribute("view", dao.view(vo));
		
		model.addAttribute("previous", dao.previous(vo));
		model.addAttribute("next", dao.next(vo));
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String view(BoardVO vo, @RequestParam("uid") int uid, SearchCriteria cri, RedirectAttributes rttr, @RequestParam(value="code") String code) throws Exception {
		logger.info("delete get======================");
		logger.info("code====================="+code);
		
		vo.setCode(code);
		vo.setUid(uid);
		
		dao.delete(vo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list?code="+code+"";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGet(BoardVO vo, @RequestParam("uid") int uid, @ModelAttribute("cri") SearchCriteria cri, Model model, @RequestParam(value="code") String code) throws Exception {
		logger.info("modify get======================");
		
		vo.setUid(uid);
		vo.setCode(code);
		
		model.addAttribute("view", dao.view(vo));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(BoardVO vo, @RequestParam("uid") int uid, HttpSession session, RedirectAttributes rttr, SearchCriteria cri, @RequestParam(value="code") String code) throws Exception {
		logger.info("modify post=====================");
		logger.info("code===================="+code);
		
		String session_names = (String) session.getAttribute("names");

		logger.info("session_name ===================="+session_names);
		
		vo.setCode(code);
		vo.setNames(session_names);
		dao.update(vo);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list?code="+code+"";
	}
	
	// 추가
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public void ajaxTest() {		
		
	}
	
	@ResponseBody
	@RequestMapping("/getAttach/{uid}")
	public List<String> getAttach(@PathVariable("uid") Integer uid)throws Exception{
		logger.info("attach====================="+uid);
		
		return dao.getAttach(uid);
	}
}
