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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cafe.domain.BoardSelectDTO;
import com.cafe.domain.BoardVO;
import com.cafe.domain.CartVO;
import com.cafe.domain.CountDTO;
import com.cafe.domain.Criteria;
import com.cafe.domain.ItemCountDTO;
import com.cafe.domain.ItemVO;
import com.cafe.domain.MemberVO;
import com.cafe.domain.MyReviewVO;
import com.cafe.domain.OdrVO;
import com.cafe.domain.OrderSelectDTO;
import com.cafe.domain.PageMaker;
import com.cafe.domain.ReviewSelectDTO;
import com.cafe.domain.TimeRecordVO;
import com.cafe.dto.ItemSelectDTO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private SqlSession Sqlsession;
	
	private static final String namespace = "com.cafe.mapper.adminMapper";
	
	@GetMapping(value="index")
	public void indexGet(Model model, BoardVO bd, OdrVO odr, CountDTO cnt, ItemCountDTO ic, MemberVO mem) throws Exception{
		logger.info("index get==========================");
		
		model.addAttribute("board", Sqlsession.selectList(namespace+".noticeSelect", bd));
		
		model.addAttribute("order", Sqlsession.selectList(namespace+".orderSelect", odr));
		
		model.addAttribute("qna", Sqlsession.selectList(namespace+".qnaSelect", bd));
		
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd");
		String date = cal.format(today);
		
		logger.info("date==================="+date);	
		
		cnt.setOd_date(date);
		model.addAttribute("order2", Sqlsession.selectOne(namespace+".orderCountJoin", cnt));
		
		ic.setIt_date(date);

		ic = Sqlsession.selectOne(namespace+".itemCountJoin", ic);
		logger.info("ic========================"+ic.toString());
		
		model.addAttribute("item", ic);
		
		mem.setToday(date);
		model.addAttribute("today", Sqlsession.selectOne(namespace+".todayCount", mem));
		
		model.addAttribute("total", Sqlsession.selectOne(namespace+".totalCount"));
		
	}
	
	@GetMapping(value="/member/list")
	public void listGet(@ModelAttribute("cri") Criteria cri, Model model, MemberVO vo) throws Exception{
		logger.info("list get==========================");
		
		PageMaker pageMaker = new PageMaker();
		logger.info("pageMaker===================="+pageMaker.toString());
		
		model.addAttribute("member", Sqlsession.selectList(namespace+".memberList", cri));
		
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131); //임의로 131개로 데이터 입력 테스트
		pageMaker.setTotalCount(Sqlsession.selectOne(namespace+".member_countPaging", cri)); //sql 카운트 처리

		model.addAttribute("pageMaker", pageMaker); //현재 페이지에 해당하는 페이징 값들
	}
	
	@GetMapping(value="/member/mem_up")
	public void mem_upGet(Model model, MemberVO vo, @RequestParam(value="id") String id) throws Exception{
		logger.info("mem_up get==========================");
		logger.info("id==============================="+id);
		
		model.addAttribute("member", Sqlsession.selectOne(namespace+".memberInfo", vo));
	}
	
	@PostMapping(value="/member/memUpdate")
	public String memberUpdatePost(MemberVO vo) throws Exception{
		logger.info("member update post======================");
		
		Sqlsession.update(namespace+".memberUpdate", vo);
		
		return "redirect:/admin/member/list";
	}
	
	@GetMapping(value = "/member/delete")
	public String memberDeleteGet(MemberVO vo, @RequestParam(value="id") String id) throws Exception{
		logger.info("member delete get================");
		logger.info("id============"+id);
		vo.setId(id);
		
		Sqlsession.update(namespace+".memberDelete", vo);
		
		return "redirect:/admin/member/list";
	}
	
	@GetMapping(value = "/member/restore")
	public String memberRestoreGet(MemberVO vo, @RequestParam(value="id") String id) throws Exception{
		logger.info("member restore get================");
		logger.info("id============"+id);
		vo.setId(id);
		
		Sqlsession.update(namespace+".memberRestore", vo);
		
		return "redirect:/admin/member/list";
	}
	
	@GetMapping(value="/item/item_rgt")
	public void itemRgtGet() throws Exception{
		logger.info("item rgt get==========================");
		
	}
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//한글 파일 이름이 깨진다면 web.xml에 한글 처리용 필터를 적용
	@RequestMapping(value = "/item/itemInsert", method = RequestMethod.POST)
	public String uploadForm(MultipartFile[] file, Model model, ItemVO vo) throws Exception {	

		logger.info("item insert post ==================");
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
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = s.format(now);
		
		vo.setIt_date(signdate);
		
		vo.setFile1(savedName[0]);
		vo.setFile2(savedName[1]);
		vo.setFile3(savedName[2]);
		logger.info("vo set file====================="+vo);
		
		String it_new = "";
		String it_season = "";
		
		if(vo.getIt_new() == null) {
			it_new = "N";
		}else {
			it_new = "Y";
		}
		
		if(vo.getIt_season() == null) {
			it_season = "N";
		}else {
			it_season = "Y";
		}
		
		vo.setIt_new(it_new);
		vo.setIt_season(it_season);
		
		Sqlsession.insert(namespace+".itemInsert", vo);
		
//		String it_category = vo.getIt_category();
//		logger.info("it_category========"+it_category);
		
		return "redirect:/admin/item/item_list";
	}
	
	@GetMapping(value="/item/item_mng")
	public void itemMngGet(Model model) throws Exception{
		logger.info("item mng get==========================");
		
	}
	
	@GetMapping("/item/list")
	public void listGet(Model model, ItemVO vo, @RequestParam(value="it_category") String it_category) throws Exception {
		logger.info("list get=====================");
		logger.info("it_category==="+it_category);
		
		vo.setIt_category(it_category);
		
		List<ItemVO> list = Sqlsession.selectList(namespace+".list2", vo);
		logger.info("list=========="+list.toString());
		
		model.addAttribute("list", list);
	}
	
	@GetMapping(value="/item/item_update")
	public void itemUpdateGet(@RequestParam("it_uid") int it_uid, Model model, ItemVO vo) throws Exception{
		logger.info("item update get===================");
		logger.info("it_uid======================="+it_uid);
		
		vo.setIt_uid(it_uid);
		logger.info("vo.toString============="+vo.toString());
		
		vo = Sqlsession.selectOne(namespace+".item_up", vo);
		logger.info("vo.toString============="+vo.toString());
		
		
		model.addAttribute("update", vo);
	}
	
	//한글 파일 이름이 깨진다면 web.xml에 한글 처리용 필터를 적용
	@RequestMapping(value = "/item/itemUpdate", method = RequestMethod.POST)
	public String uploadForm2(MultipartFile[] file, Model model, ItemVO vo) throws Exception {	

		logger.info("item update post ==================");
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
		
		String file1 = savedName[0];
		String file2 = savedName[1];
		String file3 = savedName[2];
		
		if(file1 == null || file1 == "") {
			file1 = vo.getFile1();
		}
		
		if(file2 == null || file2 == "") {
			file2 = vo.getFile2();
		}
		
		if(file3 == null || file3 == "") {
			file3 = vo.getFile3();
		}
		
		vo.setFile1(file1);
		vo.setFile2(file2);
		vo.setFile3(file3);
		
		
		logger.info("vo set file====================="+vo);
		
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = s.format(now);
		
		vo.setIt_date(signdate);
		
		
		String it_new = vo.getIt_new();
		
		if(it_new == null || it_new == "") {
			it_new = "N";
		}else {
			it_new = "Y";
		}
		
		vo.setIt_new(it_new);
		
		
		String it_season = vo.getIt_season();
		
		if(it_season == null || it_season == "") {
			it_season = "N";
		}else {
			it_season = "Y";
		}
		
		vo.setIt_season(it_season);
		
		
		Sqlsession.update(namespace+".itemUpdate", vo);
		logger.info("vo.toString======================"+vo.toString());
		
		
		return "redirect:/admin/item/item_list";
	}
	
	@GetMapping(value="/order/od_mng")
	public void od_mngGet(@ModelAttribute("cri") Criteria cri, Model model, OrderSelectDTO slt, HttpSession session) throws Exception{
		logger.info("od_mng get====================");
		
//		int tc = Sqlsession.selectOne(namespace+".od_total", vo);
//		model.addAttribute("tc", tc);
//		logger.info("tc=========="+tc);
		
		PageMaker pageMaker = new PageMaker();
		logger.info("pageMaker===================="+pageMaker.toString());
		
		List<OdrVO> list = Sqlsession.selectList(namespace+".od_list", cri);
		
		String allCheck = "N";
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getChecked().equals("Y")) {
				allCheck = "Y";
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("allCheck", allCheck);
		model.addAttribute("total", Sqlsession.selectOne(namespace+".od_count", slt));
		
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131); //임의로 131개로 데이터 입력 테스트
		pageMaker.setTotalCount(Sqlsession.selectOne(namespace+".od_count", slt)); //sql 카운트 처리

		model.addAttribute("pageMaker", pageMaker); //현재 페이지에 해당하는 페이징 값들
	}
	
	@RequestMapping(value = "/order/orderCheck", method = RequestMethod.POST)
	@ResponseBody
	public void orderCheck(OdrVO vo, int od_group) throws Exception{
		logger.info("orderCheck=======================");
		logger.info("============="+vo.getChecked());
		logger.info("============="+vo.getOd_group());
		
		vo.setOd_group(od_group);
		Sqlsession.update(namespace+".orderCheck", vo);
	}
	
	@RequestMapping(value = "/order/checkAll", method = RequestMethod.POST)
	@ResponseBody
	public void checkAll(String checkAll, OdrVO vo) throws Exception{
		logger.info("checkAll=======================");
		
		if(checkAll.equals("0")){
			vo.setChecked("0");
		}else {
			vo.setChecked("1");
		}
		
		logger.info("============="+vo.toString());
		Sqlsession.update(namespace+".checkAll", vo);
	}
	
	@PostMapping(value="/order/prepare")
	public String prepare(TimeRecordVO vo) throws Exception{
		logger.info("prepare post=====================");
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = s.format(now);
		
		vo.setToday(signdate);
		
		Sqlsession.update(namespace+".prepare", vo);	
		
		return "redirect:/admin/item/item_list";
	}
	
	@PostMapping(value="/order/start")
	public String start(TimeRecordVO vo) throws Exception{
		logger.info("start post=====================");
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = s.format(now);
		
		vo.setToday(signdate);
		
		Sqlsession.update(namespace+".start", vo);	
		
		return "redirect:/admin/item/item_list";
	}
	
	@PostMapping(value="/order/complete")
	public String complete(TimeRecordVO vo) throws Exception{
		logger.info("complete post=====================");
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = s.format(now);
		
		vo.setToday(signdate);
		
		Sqlsession.update(namespace+".complete", vo);	
		
		return "redirect:/admin/item/item_list";
	}
	
	@PostMapping(value="/order/orderStatus")
	public String orderStatusPost(OdrVO vo, String od_status, int od_group, TimeRecordVO tr) throws Exception{
		logger.info("order status post=================");
		logger.info("od_status========="+od_status);
		logger.info("od_group============"+od_group);
		
		vo.setOd_status(od_status);
		vo.setOd_uid(od_group);
		
		Sqlsession.update(namespace+".orderStatus", vo);
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = s.format(now);
		
		String ods = vo.getOd_status();
		logger.info("ods=============="+vo.getOd_status());
			
		
		if(ods.equals("상품준비중")) {
			String pay_done = signdate;
			logger.info("pay_done+++++++++"+pay_done);
			tr.setPay_done(pay_done);
			Sqlsession.update(namespace+".pay_done_update", tr);
		}
		if(ods.equals("배송출발")) {
			String delivering = signdate;
			logger.info("delivering+++++++++"+delivering);
			tr.setDelivering(delivering);
			Sqlsession.update(namespace+".delivering_update", tr);
		}
		if(ods.equals("배송완료")) {
			String dvr_done = signdate;
			
			tr.setDvr_done(dvr_done);
			Sqlsession.update(namespace+".dvr_done_update", tr);
		}
		if(ods.equals("주문취소")) {
			String od_cancel = signdate;
			
			tr.setOd_cancel(od_cancel);
			Sqlsession.update(namespace+".od_cancel_update", tr);
		}
		if(ods.equals("반품")) {
			String it_refund = signdate;
			
			tr.setIt_refund(it_refund);
			Sqlsession.update(namespace+".it_refund_update", tr);
		}	
		
		return "redirect:/admin/order/od_mng";
	}
	
	@GetMapping(value = "/order/od_detail")
	public void od_detailGet(OdrVO odr, Model model, HttpSession session, CartVO cart, @RequestParam(value="od_group") int od_group, TimeRecordVO tr) throws Exception{
		logger.info("od_detail get=====================");
		
		cart.setOd_group(od_group);
		logger.info("od_group========"+od_group);
		
		List<CartVO> ct = Sqlsession.selectList(namespace+".od_detail", cart);
		logger.info("ct=========="+ct);
		
		model.addAttribute("detail", ct );
		
		odr.setOd_group(od_group);
		model.addAttribute("ordered", Sqlsession.selectOne(namespace+".orderComplete", odr));
		
		model.addAttribute("orderer", Sqlsession.selectOne(namespace+".ordererInfo", odr));
		
		tr.setOd_group(od_group);
		tr = Sqlsession.selectOne(namespace+".timeRecord", tr);
		logger.info("tr=================="+tr);
		
		model.addAttribute("time", tr);
	}
	
	@GetMapping(value = "/item/item_list")
	public void item_listGet(@ModelAttribute("cri") Criteria cri, Model model, ItemSelectDTO slt) throws Exception{
		logger.info("item_list get=====================");
		logger.info("++++++++++++"+slt.toString());
		
		PageMaker pageMaker = new PageMaker();
		logger.info("pageMaker===================="+pageMaker.toString());

		model.addAttribute("list", Sqlsession.selectList(namespace+".itemSelect", cri));
		
		int tc = Sqlsession.selectOne(namespace+".item_total", slt);
		model.addAttribute("tc", tc);
		
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131); //임의로 131개로 데이터 입력 테스트
		pageMaker.setTotalCount(tc); //sql 카운트 처리

		model.addAttribute("pageMaker", pageMaker); //현재 페이지에 해당하는 페이징 값들

	}
	
	@GetMapping(value="/item/item_review")
	public void item_review(@ModelAttribute("cri") Criteria cri, Model model, ReviewSelectDTO slt) throws Exception{
		logger.info("item_review=====================");
		logger.info("++++++++++++"+slt.toString());
		
		PageMaker pageMaker = new PageMaker();
		logger.info("pageMaker===================="+pageMaker.toString());
		
		model.addAttribute("review", Sqlsession.selectList(namespace+".ReviewSelect", cri));
		
		model.addAttribute("total", Sqlsession.selectOne(namespace+".ReviewCount", slt));
		
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131); //임의로 131개로 데이터 입력 테스트
		pageMaker.setTotalCount(Sqlsession.selectOne(namespace+".ReviewCount", slt)); //sql 카운트 처리

		model.addAttribute("pageMaker", pageMaker); //현재 페이지에 해당하는 페이징 값들
	}
	
	@PostMapping(value="/item/itemDlt")
	public String itemDlt(int it_uid, ItemVO vo) throws Exception{
		logger.info("itemDlt post====================="+it_uid);
		
		vo.setIt_uid(it_uid);
		Sqlsession.delete(namespace+".itemDlt", vo);
		
		return "redirect:/admin/item/item_list";
	}
	
	@PostMapping(value="/item/reviewDlt")
	public String reviewDlt(int od_group, MyReviewVO vo) throws Exception{
		logger.info("reviewDlt post====================="+od_group);
		
		vo.setOd_group(od_group);
		Sqlsession.delete(namespace+".reviewDlt", vo);
		
		return "redirect:/admin/item/item_review";
	}
	
	@GetMapping(value="/board/board_list")
	public void board_listGet(@ModelAttribute("cri") Criteria cri, Model model, BoardSelectDTO slt) throws Exception{
		logger.info("board get==========================");
		logger.info("++++++++++++"+slt.toString());
		
		PageMaker pageMaker = new PageMaker();
		logger.info("pageMaker===================="+pageMaker.toString());
		
		model.addAttribute("b", Sqlsession.selectList(namespace+".boardSelect", cri));
		
		model.addAttribute("total", Sqlsession.selectOne(namespace+".board_count", slt));
		
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131); //임의로 131개로 데이터 입력 테스트
		pageMaker.setTotalCount(Sqlsession.selectOne(namespace+".board_count", slt)); //sql 카운트 처리

		model.addAttribute("pageMaker", pageMaker); //현재 페이지에 해당하는 페이징 값들
		
	}
	
	@PostMapping(value="/board/boardDlt")
	public String boardDlt(int uid, BoardVO vo) throws Exception{
		logger.info("boardDlt post====================="+uid);
		
		vo.setUid(uid);
		Sqlsession.delete(namespace+".boardDlt", vo);
		
		return "redirect:/admin/board/board_list";
	}
	
}
