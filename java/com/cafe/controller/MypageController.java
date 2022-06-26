package com.cafe.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.cafe.domain.BoardVO;
import com.cafe.domain.Criteria;
import com.cafe.domain.DtnVO;
import com.cafe.domain.MyReviewVO;
import com.cafe.domain.OdrVO;
import com.cafe.domain.PageMaker;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private SqlSession Sqlsession;
	
	private static final String namespace = "com.cafe.mapper.mypageMapper";
	
	@RequestMapping(value = "my_dtn", method = RequestMethod.GET)
	public void my_dtnGET(DtnVO vo, Model model, HttpSession session) throws Exception{
		logger.info("my_dtn get=====================");
		
		String session_id = (String)session.getAttribute("id");
		vo.setId(session_id);
		
		List<DtnVO> dtn = Sqlsession.selectList(namespace+".selectMyDtn", vo);
		
		model.addAttribute("dtn", dtn);
		
	}
	
	@PostMapping(value = "/mypage/addDtn")
	public String addDtnPost(Model model, DtnVO vo, HttpSession session, String names, String zip, String addr1, String addr2, String tel) throws Exception{
		logger.info("addDtn post=================");
		logger.info("names================="+names);
		logger.info("zip================="+zip);
		logger.info("addr1================="+addr1);
		logger.info("addr2================="+addr2);
		logger.info("tel================="+tel);
		
		String session_id = (String)session.getAttribute("id");
		vo.setId(session_id);
		
		vo.setNames(names);
		vo.setZip(zip);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setTel(tel);
		
		Sqlsession.insert(namespace+".insertDtn", vo);
		
		
		return "redirect:/mypage/my_dtn";
	}
	
	@PostMapping(value = "/deleteDtn")
	public String deleteDtnPost(int uid, DtnVO vo) throws Exception{
		logger.info("deleteDtn post=================");
		logger.info("uid================="+uid);
		
		vo.setUid(uid);
		
		Sqlsession.delete(namespace+".deleteDtn", vo);
		
		return "redirect:/mypage/my_dtn";
	}
	
	
	@GetMapping(value = "/review")
	public void reviewGet() throws Exception{
		logger.info("review get===============");
		
	}
	
	
	@GetMapping(value = "/item_review")
	public void item_reviewGet(OdrVO vo, Model model, int od_group) throws Exception{
		logger.info("item_review get===============");
		logger.info("od_group=================="+od_group);
		
		vo.setOd_group(od_group);
		
		model.addAttribute("review", Sqlsession.selectOne(namespace+".review_info", vo));
	}
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//한글 파일 이름이 깨진다면 web.xml에 한글 처리용 필터를 적용
	@PostMapping(value = "/myReview")
	public String myReviewPost(MultipartFile[] file, MyReviewVO vo, HttpSession session, OdrVO odr) throws Exception{
		logger.info("myReview post==================");
		logger.info("file.length =================:"+file.length);
		
		String savedName[] = new String[file.length];  //저장 파일명 배열 처리
		
		for(int i=0; i<file.length; i++) {
			
			if(file[i].getSize() > 0) { //파일크기가 0보다 크다면 : 파일 유무
				
				logger.info("originalName: " + file[i].getOriginalFilename());
				logger.info("size: " + file[i].getSize()); //byte 단위
				logger.info("contentType: " + file[i].getContentType());
				
				Date today = new Date();
				SimpleDateFormat cal = new SimpleDateFormat("yyyyMMddHHmmss");
				String signdate = cal.format(today);
				
				savedName[i] = signdate + "_" + file[i].getOriginalFilename(); //날짜_파일명 처리
				byte[] fileData = file[i].getBytes();
				
				logger.info("============= savedName["+i+"] ====:"+savedName[i]);
				
				File target = new File(uploadPath, savedName[i]);			
			
				FileCopyUtils.copy(fileData, target); //파일 업로드
			}
		}
		
		vo.setFile1(savedName[0]);
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = s.format(now);
		
		vo.setDate(date);
		
		String session_id = (String)session.getAttribute("id");
		
		vo.setId(session_id);
		
		Sqlsession.insert(namespace+".myReview_insert", vo);
		
		int od_group = vo.getOd_group();
		
		odr.setReview("Y");
		odr.setOd_group(od_group);
		Sqlsession.update(namespace+".reviewDone", odr);
		
		return "redirect:/mypage/my_review";
	}
	
	@GetMapping(value = "/my_review")
	public void my_reviewGet(Model model, MyReviewVO vo, HttpSession session) throws Exception{
		logger.info("my_review get===============");
		
		String session_id = (String)session.getAttribute("id");
		vo.setId(session_id);
		
		
		model.addAttribute("list", Sqlsession.selectList(namespace+".SelectMyReview", vo));

	}
	
	@PostMapping(value = "/mypage/myReview_dlt")
	public String myReview_dltpost(int od_group, MyReviewVO vo) throws Exception{
		logger.info("myReview_dlt post=================");
		logger.info("od_group================="+od_group);
		
		vo.setOd_group(od_group);
		
		Sqlsession.delete(namespace+".myReview_dlt", vo);
		
		return "redirect:/mypage/my_review";
	}
	
	@GetMapping(value = "/my_board")
	public void my_boardGet(@ModelAttribute("cri") Criteria cri, Model model, BoardVO vo, HttpSession session) throws Exception{
		logger.info("my_board get===============");
		logger.info(cri.toString());
		
		PageMaker pageMaker = new PageMaker();
		logger.info("pageMaker===================="+pageMaker.toString());
		
		String session_id = (String)session.getAttribute("id");
		
		cri.setId(session_id);
		
		List<BoardVO> list = Sqlsession.selectList(namespace+".myBoardSelect", cri);
		logger.info("list============================"+list.toString());
		
		model.addAttribute("board", list);

		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131); //임의로 131개로 데이터 입력 테스트
		pageMaker.setTotalCount(Sqlsession.selectOne(namespace+".myBoard_countPaging", cri)); //sql 카운트 처리

		model.addAttribute("pageMaker", pageMaker); //현재 페이지에 해당하는 페이징 값들
	}
	
	@PostMapping(value = "/mypage/boardDlt")
	public String boardDltPost(int uid, BoardVO vo) throws Exception{
		logger.info("boardDlt post=================");
		logger.info("uid================="+uid);
		
		Sqlsession.delete(namespace+".myBoardDlt", vo);
		
		return "redirect:/mypage/my_board";
	}
	
}
