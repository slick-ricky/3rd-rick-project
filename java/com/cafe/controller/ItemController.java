package com.cafe.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe.domain.CartVO;
import com.cafe.domain.DtnVO;
import com.cafe.domain.ItemVO;
import com.cafe.domain.MemberVO;
import com.cafe.domain.MyReviewVO;
import com.cafe.domain.OdrVO;
import com.cafe.domain.TimeRecordVO;
import com.cafe.domain.TimeVO;
import com.cafe.domain.TotalPrice2VO;
import com.cafe.domain.TotalPriceVO;

@Controller
@RequestMapping("/item/*")
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Inject
	private SqlSession Sqlsession;
	
	private static final String namespace = "com.cafe.mapper.ItemMapper";
	
	@GetMapping("/list")
	public void listGet(Model model, ItemVO vo, @RequestParam(value="it_category") String it_category) throws Exception {
		logger.info("list get=====================");
		logger.info("it_category==="+it_category);
		
		vo.setIt_category(it_category);
		
		List<ItemVO> list = Sqlsession.selectList(namespace+".list", vo);
		logger.info("list=========="+list.toString());
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void viewGet(int it_uid, Model model, ItemVO vo, @RequestParam(value="it_category") String it_category, MyReviewVO rv) throws Exception {
		logger.info("view get=======================");
		logger.info("it_category==="+it_category);
		
		vo.setIt_category(it_category);
		vo.setIt_uid(it_uid);
		
		model.addAttribute("item", Sqlsession.selectOne(namespace+".view", vo));
		
		logger.info("it_uid+++++++++++++"+it_uid);
		
		rv.setIt_uid(it_uid);
		
		List<MyReviewVO> list = Sqlsession.selectList(namespace+".SelectItemReview", rv);
		logger.info("myReview list====================="+list.toString());
		
		model.addAttribute("review", list);
	}
	
	@RequestMapping(value = "/cartinsert", method = RequestMethod.POST)
	public String cartinsertPost(CartVO vo, HttpSession session, @RequestParam("it_uid") int it_uid) throws Exception {
		logger.info("cartinsert post=======================");
		
		String session_id = (String)session.getAttribute("id");
		String session_names = (String)session.getAttribute("names");
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = s.format(now);
		
		vo.setCt_date(date);
		
		SimpleDateFormat s2 = new  SimpleDateFormat("yyyyMMddHHmmss");
		String date2 = s2.format(now);
		
		String od_num = date2 + session_id + it_uid;
		logger.info("==============="+od_num);
		
		vo.setOd_num(od_num);
		vo.setId(session_id);
		vo.setNames(session_names);
		
		Sqlsession.insert(namespace+".cartCreate", vo);
		
		return "redirect:/item/cart";
	}
	
	@RequestMapping(value = "/cartCount", method = RequestMethod.POST)
	@ResponseBody
	public int cartCount(String id) throws Exception {
		logger.info("cartCount post=======================");
		int cart_count = Sqlsession.selectOne(namespace+".cart_count",id);
		
		
		return cart_count;
	}
	
	@RequestMapping(value = "/reloadPoint", method = RequestMethod.POST)
	@ResponseBody
	public int reloadPoint(String id) throws Exception {
		logger.info("reloadPoint post=======================");
		int mem_point = Sqlsession.selectOne(namespace+".mem_point",id);

		
		return mem_point;
	}
	
	@GetMapping("/cart")
	public void cartGet(Model model, CartVO vo, HttpSession session) throws Exception {
		logger.info("cart list========================");
		
		String session_id = (String)session.getAttribute("id");
		vo.setId(session_id);
		logger.info("session_id========================"+session_id);
		
		List<CartVO> list = Sqlsession.selectList(namespace+".cartList", vo);
		logger.info("cart======"+list);
		
		int allCheck = 1;
		System.out.println(list.toString());
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getChecked().equals("0")) {
				allCheck = 0;
			}
		}
		//logger.info("allCheck========================"+allCheck);
		TotalPriceVO tp = new TotalPriceVO();
		tp = tp.getTotal(list);
		//logger.info("======================"+tp);
		//logger.info("======================"+tp.getTotalPrice());
		
		model.addAttribute("tp", tp);
		model.addAttribute("allCheck", allCheck);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value = "/itemCheck", method = RequestMethod.POST)
	@ResponseBody
	public void itemCheck(HttpSession session, CartVO vo) throws Exception{
		logger.info("itemCheck=======================");
		logger.info("============="+vo.getChecked());
		logger.info("============="+vo.getOd_num());
		
		vo.setId((String)session.getAttribute("id"));
		Sqlsession.update(namespace+".itemCheck", vo);
	}
	
	@RequestMapping(value = "/checkAll", method = RequestMethod.POST)
	@ResponseBody
	public void checkAll(HttpSession session, String checkAll, CartVO vo) throws Exception{
		logger.info("checkAll=======================");
			
		vo.setId((String)session.getAttribute("id"));
		
		if(checkAll.equals("1")){
			vo.setChecked("1");
		}else {
			vo.setChecked("0");
		}
		
		logger.info("============="+vo.toString());
		Sqlsession.update(namespace+".checkAll", vo);
	}
	
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public void payPost(CartVO vo, Model model, HttpSession session, TotalPriceVO tp) throws Exception{
		logger.info("pay post============================");
		vo.setId((String)session.getAttribute("id"));
		
		List<CartVO> list = Sqlsession.selectList(namespace+".payList", vo);
		
		String today = null;
		Date date = new Date();
		System.out.println(date); //Thu May 13 13:25:57 KST 2021
		// 포맷변경 ( 년월일 시분초)
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분"); 
		
		// Java 시간 더하기
		Calendar cal = Calendar.getInstance();
		cal.setTime(date); 
		today = sdformat.format(cal.getTime()); 
		cal.add(Calendar.DATE, +2);
		today = sdformat.format(cal.getTime());  
		
		TimeVO tm = new TimeVO();
		
		tm.setTime2(today);
		
		tp = tp.getTotal(list);
		
		model.addAttribute("tm", tm);
		model.addAttribute("amount", Sqlsession.selectOne(namespace+".order_count", vo));
		model.addAttribute("tp", tp);
		model.addAttribute("list", list);
		model.addAttribute("pay", Sqlsession.selectOne(namespace+".payInfo", vo));
	}
	
	@PostMapping(value = "updatePoint2")
	public String updatePoint2Post(int point, MemberVO mem, HttpSession session, String od_num) throws Exception{
		logger.info("update point from pay2 / post================");
		logger.info("남은 포인트==================="+point);
		logger.info("od_num======================"+od_num);
		
		String session_id = (String)session.getAttribute("id");
		
		mem.setId(session_id);
		mem.setPoint(point);
		
		Sqlsession.update(namespace+".updatePoint", mem);
		
		return "redirect:/item/pay";
	}
	
	
	@RequestMapping(value = "/orderInsert", method = RequestMethod.POST)
	public String orderInsertPost(ItemVO it, OdrVO vo, HttpSession session, CartVO ct, RedirectAttributes rttr, TimeRecordVO tr, MemberVO mem) throws Exception{
		logger.info("orderInsert post==================");
		
		String session_id = (String)session.getAttribute("id");
		
		vo.setId(session_id);
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = s.format(now);
		
		vo.setOd_date(date);
		
		vo.setOd_status("입금대기중");
//		System.out.println("=====paywey====:"+vo.getPayway());
//		System.out.println("=====paybank====:"+vo.getPaybank());
		
		if(vo.getPayway().equals("카카오페이")) {
			vo.setPaybank("");
		}
		System.out.println("=====paybank====:"+vo.getPaybank());
		
		int aa = (int)Math.floor((Math.random()*1000000000));
		logger.info("랜덤값======"+aa);
		
		vo.setOd_group(aa);
		ct.setOd_group(aa);
		
		String kko = vo.getPayway();
		String od_status = vo.getOd_status();
		
		if(kko.equals("카카오페이")) {
			od_status = "상품준비중";
		}else {
			od_status = "입금대기중";
		}
		
		vo.setOd_status(od_status);
		
		Sqlsession.insert(namespace+".orderInsert", vo);
		
		ct.setId(session_id);
		Sqlsession.update(namespace+".cartDelete", ct);
		
		tr.setOd_group(aa);
		tr.setOd_received(date);
		tr.setOd_cancel("");
		
		String paid;
		
		if(kko.equals("카카오페이")) {
			paid = date;
		}else {
			paid = null;
		}
		
		tr.setPay_done(paid);
		
		Sqlsession.insert(namespace+".trInsert", tr);
		
		//포인트 적립
		int totalPay = vo.getTp_od();
		int point = (int)(totalPay * 0.01);
		logger.info("적립포인트====================="+point);
		
		int session_point = (Integer)session.getAttribute("point");
		
		int sumPoint = session_point + point;
		
		mem.setPoint(sumPoint);
		mem.setId(session_id);
		Sqlsession.update(namespace+".pilePoint", mem);
		
		rttr.addAttribute("od_group", aa);
		
		
		//재고 소진
		ct.setOd_group(aa);
		Sqlsession.update(namespace+".it_Deduction", ct);
	
		return "redirect:/item/od_complete";
	}	
	
	@RequestMapping(value = "/od_complete", method = RequestMethod.GET)
	public void od_completeGet(OdrVO vo, Model model, HttpSession session, TotalPriceVO tp, @RequestParam(value= "od_group") int od_group) throws Exception {
		logger.info("od_complete get=======================");
		
		vo.setId((String) session.getAttribute("id"));
		vo.setOd_group(od_group);
		logger.info("od_group========"+od_group);
		
		model.addAttribute("ordered", Sqlsession.selectOne(namespace+".orderComplete", vo));
		
		List<CartVO> list = Sqlsession.selectList(namespace+".payList", vo);
		tp = tp.getTotal(list);

		model.addAttribute("tp", tp);
		logger.info("tp======================"+tp.getTotalPrice());
		logger.info("tp======================"+tp.getDeliveryPrice());
		
	}
	
	@RequestMapping(value = "buynow", method = RequestMethod.POST)
	public String buynowPost(HttpSession session, CartVO vo, @RequestParam("it_uid") int it_uid, Model model, RedirectAttributes rttr) throws Exception{
		logger.info("buynow post====================");
		
		String session_id = (String)session.getAttribute("id");
		String session_names = (String)session.getAttribute("names");
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = s.format(now);
		
		vo.setCt_date(date);
		
		SimpleDateFormat s2 = new  SimpleDateFormat("yyyyMMddHHmmss");
		String date2 = s2.format(now);
		
		String od_num = date2 + session_id + it_uid;
//		logger.info("==============="+od_num);
		
		vo.setOd_num(od_num);
		vo.setId(session_id);
		vo.setNames(session_names);
		vo.setChecked("1");
		Sqlsession.update(namespace+".removeChecked", vo);
		Sqlsession.insert(namespace+".cartCreate2", vo);
		
		
		rttr.addAttribute("od_num", od_num);
		
		
		return "redirect:/item/pay2";
	}
	
	
	@RequestMapping(value = "pay2", method = RequestMethod.GET)
	public void pay2Get(CartVO vo, Model model, HttpSession session, @RequestParam(value="od_num") String od_num, TotalPrice2VO tp) throws Exception{
		logger.info("pay2 get=======================");
		logger.info("od_num========================"+od_num);
		
		
			String today = null;
			Date date = new Date();
			System.out.println(date); //Thu May 13 13:25:57 KST 2021
			// 포맷변경 ( 년월일 시분초)
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분"); 
			// Java 시간 더하기
			Calendar cal = Calendar.getInstance();
			cal.setTime(date); 
			today = sdformat.format(cal.getTime()); 
			cal.add(Calendar.DATE, +2);
			today = sdformat.format(cal.getTime());  
		
			TimeVO tm = new TimeVO();
			tm.setTime2(today);
			
			model.addAttribute("tm", tm);
			
			String session_id = (String)session.getAttribute("id");
			vo.setId(session_id);
			vo.setOd_num(od_num);
			
			vo = Sqlsession.selectOne(namespace+".payInfo2", vo);
			logger.info("pkt2==============="+vo.toString());
			model.addAttribute("pay", vo);
			
			tp = tp.getTotal(vo);
			logger.info("tp============"+tp.getTotalPrice());
			logger.info("dp============"+tp.getDeliveryPrice());
			
			model.addAttribute("tp", tp);
			model.addAttribute("amount", Sqlsession.selectOne(namespace+".order_count", vo));
	
	}
	
	@PostMapping(value = "setDtn")
	@ResponseBody
	public Model setDtnPost(int uid, DtnVO dtn, Model model) throws Exception{
		logger.info("uid================"+uid);
		
		dtn.setUid(uid);
		model.addAttribute("dtn", Sqlsession.selectOne(namespace+".selectDtn2", dtn));
		
		return model;
	}
	
	@PostMapping(value = "updatePoint")
	public String updatePointPost(int point, MemberVO mem, HttpSession session, String od_num) throws Exception{
		logger.info("update point from pay2 / post================");
		logger.info("남은 포인트==================="+point);
		logger.info("od_num======================"+od_num);
		
		String session_id = (String)session.getAttribute("id");
		
		mem.setId(session_id);
		mem.setPoint(point);
		
		Sqlsession.update(namespace+".updatePoint", mem);
		
		return "redirect:/item/pay2?od_num="+od_num+"";
	}

	
	@RequestMapping(value="/od_list", method=RequestMethod.GET)
	public void od_listGET(Model model, HttpSession session, OdrVO vo, TimeRecordVO tr) throws Exception{
		logger.info("od_list get===================");
		
		String session_id = (String)session.getAttribute("id");
		
		vo.setId(session_id);
		List<OdrVO> order = Sqlsession.selectList(namespace+".orderList", vo);
		logger.info("order==="+order);
		
		model.addAttribute("list", order);
		model.addAttribute("count", Sqlsession.selectOne(namespace+".order_count", vo));
	}
	
	@RequestMapping(value="/od_cancel", method=RequestMethod.GET)
	public void od_cancelGET(Model model, HttpSession session, OdrVO vo, TimeRecordVO tr) throws Exception{
		logger.info("od_list get===================");
		
		String session_id = (String)session.getAttribute("id");
		
		vo.setId(session_id);
		List<OdrVO> order = Sqlsession.selectList(namespace+".orderCancel", vo);
		logger.info("order==="+order);
		
		model.addAttribute("list", order);
		model.addAttribute("count", Sqlsession.selectOne(namespace+".order_count", vo));
	}
	
	@RequestMapping(value="/od_detail", method=RequestMethod.GET)
	public void od_detailGET(OdrVO odr, Model model, HttpSession session, CartVO cart, @RequestParam(value="od_group") int od_group, TimeRecordVO tr) throws Exception{
		logger.info("od_detail get===================");
		
		String session_id = (String)session.getAttribute("id");
		cart.setId(session_id);
		
		cart.setOd_group(od_group);
		logger.info("od_group========"+od_group);
		
		List<CartVO> ct = Sqlsession.selectList(namespace+".od_detail", cart);
		logger.info("ct=========="+ct);
		
		model.addAttribute("detail", ct );
		
		odr.setOd_group(od_group);
		model.addAttribute("ordered", Sqlsession.selectOne(namespace+".orderComplete", odr));
		
		model.addAttribute("tr", Sqlsession.selectOne(namespace+".trSelect", tr));
	}
	
	@RequestMapping(value="/od_detail2", method=RequestMethod.GET)
	public void od_detail2GET(OdrVO odr, Model model, HttpSession session, CartVO cart, @RequestParam(value="od_group") int od_group, TimeRecordVO tr) throws Exception{
		logger.info("od_detail get===================");
		
		String session_id = (String)session.getAttribute("id");
		cart.setId(session_id);
		
		cart.setOd_group(od_group);
		logger.info("od_group========"+od_group);
		
		List<CartVO> ct = Sqlsession.selectList(namespace+".od_detail", cart);
		logger.info("ct=========="+ct);
		
		model.addAttribute("detail", ct );
		
		odr.setOd_group(od_group);
		model.addAttribute("ordered", Sqlsession.selectOne(namespace+".orderComplete", odr));
		
		model.addAttribute("tr", Sqlsession.selectOne(namespace+".trSelect", tr));
	}
	
	@RequestMapping(value="od_dlt", method=RequestMethod.POST)
	public String od_dltPost(TimeRecordVO vo, int od_group, OdrVO odr) throws Exception{
		logger.info("od_dlt post====================");
		logger.info("od_group========="+od_group);
		
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = s.format(now);
		
		vo.setOd_group(od_group);
		vo.setOd_cancel(date);
		
		Sqlsession.update(namespace+".orderCancel_up", vo);
		
		odr.setOd_status("주문취소");
		
		Sqlsession.update(namespace+".orderCancel_up2", odr);
		
		return "redirect:/item/od_list";
	}
	
	@RequestMapping(value = "ct_dlt", method = RequestMethod.POST)
	public String ct_dltPost(CartVO vo, HttpSession session, int ct_uid) throws Exception{
		logger.info("ct_dlt post======================");
		logger.info("ct_uid============="+ct_uid);
		
		String session_id = (String)session.getAttribute("id");
		
		vo.setId(session_id);
		vo.setCt_uid(ct_uid);
		
		Sqlsession.delete(namespace+".ct_dtl", vo);
		
		return "redirect:/item/cart";
	}
	
	@GetMapping(value = "/callDtn")
	public void callDtnGet(Model model, DtnVO vo, HttpSession session) throws Exception{
		logger.info("callDtn get===============");
	
		String session_id = (String)session.getAttribute("id");
		vo.setId(session_id);
		
		List<DtnVO> dtn = Sqlsession.selectList(namespace+".selectMyDtn", vo);
		
		model.addAttribute("dtn", dtn);
	}
	
	@GetMapping(value = "kakaoPay")
	public void kakaoPay() throws Exception{
		logger.info("kakaoPay get====================");
		
	}
	
	//@PostMapping(value = "/kakaoPay")
	@RequestMapping(value ="/kakaoPay", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String kakaoPayPost(int od_count, int totalPay) throws Exception{

		logger.info("kakaoPay Post======================="+totalPay);
		
		
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection serverConnection = (HttpURLConnection) address.openConnection();
			serverConnection.setRequestMethod("POST");
			serverConnection.setRequestProperty("Authorization", "KakaoAK 9c5ac43ec20732d582972c5d6fa6ac38");
			serverConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			serverConnection.setDoOutput(true);
			String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=Coffee Kingdom&quantity="+od_count+"&total_amount="+totalPay+"&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8080/item/success&fail_url=http://192.168.201.76:8080/item/fail&cancel_url=http://192.168.201.76:8080/item/cancel";
			OutputStream sender = serverConnection.getOutputStream();
			DataOutputStream dataSender = new DataOutputStream(sender);
			dataSender.writeBytes(parameter);
			dataSender.close();
			
			int payResult = serverConnection.getResponseCode();
			
			InputStream receiver;
			if(payResult == 200) {
				receiver = serverConnection.getInputStream();
			}else {
				receiver = serverConnection.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(receiver);
			BufferedReader changeMaker = new BufferedReader(reader);
			return changeMaker.readLine();
			
		}catch(MalformedURLException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
		
		return "{\"result\" : \"NO\"}";
	}
	
	@GetMapping("/success")
	public void paySuccess(String pg_token) throws Exception {
		System.out.println(pg_token);
		
	}
	
}
