package com.cafe.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe.domain.MemberVO;
import com.cafe.domain.VisitVO;
import com.cafe.dto.LoginDTO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.cafe.mapper.MemberMapper";
	
	@GetMapping("/join")
	public void joinGet() throws Exception {
		logger.info("join get======================");
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String joinPost(MemberVO member, Model model) throws Exception {
		logger.info("join post======================");
		logger.info(member.toString());
		
		//�ð� �޼ҵ�
		Date now = new Date();
		String strl = now.toString();
		SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String signdate = s.format(now);
		
		member.setSigndate(signdate);
		member.setLevel("0");
		member.setDelmember("N");
		
		sqlSession.insert(namespace+".insertMember", member);
		
		model.addAttribute("msg", "ȸ�����Կ� �����߽��ϴ�.");
		model.addAttribute("url", "/");
		
		return "/member/alert";
	}
	
	@GetMapping("/login")
	public void loginGET() throws Exception {
		logger.info("login get ...........");
	}

	@PostMapping("/login")
	public String loginPOST(MemberVO vo, LoginDTO dto, HttpSession session, RedirectAttributes rttr, VisitVO vs) throws Exception {
		logger.info("login post ...........");
		logger.info(dto.toString());

		int num = sqlSession.selectOne(namespace+".loginNum", dto);
		logger.info("==num==:"+num);
		
		
		if(num == 1) {
			vo = sqlSession.selectOne(namespace+".login", dto);
			logger.info("vo========"+vo.toString());
			
			if(vo.getDelmember().equals("Y")) {
				rttr.addFlashAttribute("msg", "Ż���� ȸ���Դϴ�.");
				
				return "redirect:/member/login";
			}else {
				session.setAttribute("id", vo.getId());
				session.setAttribute("names", vo.getNames());
				session.setAttribute("level", vo.getLevel());
				session.setAttribute("point", vo.getPoint());
				
				Date now = new Date();
				String strl = now.toString();
				SimpleDateFormat s = new  SimpleDateFormat("yyyy-MM-dd");
				String signdate = s.format(now);
				
				String aa = vo.getId();
				logger.info("aa================="+aa);
				
				vs.setToday(signdate);
				vs.setId(aa);
				vs.setSigndate(signdate);
				sqlSession.insert(namespace+".insertVisit", vs);
				
				
				vo.setLogin_date(signdate);
				vo.setId(aa);
				sqlSession.update(namespace+".updateLoginDate", vo);
				
				return "redirect:/";
			}		
		}else {		
			rttr.addFlashAttribute("msg", "�α��� ������ �ùٸ��� �ʽ��ϴ�.");
			
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logoutGet(HttpSession session)throws Exception {
		logger.info("logout get====================");
		
		session.invalidate();
		return "redirect:/";
	}
	
	//ȸ�����翩�� Ȯ��
	@ResponseBody
	@RequestMapping(value = "/idok", produces="text/plain;charset=UTF-8") 
	public String memberCheck(String id, MemberVO member, HttpServletResponse response)throws Exception {
		logger.info("member check==================="+id);
		
		int num = sqlSession.selectOne(namespace+".memberCheck", member);
		
		String msg = "";
		if(id.length() < 4) {
			msg = "<font color=red>���̵�� 4�ڸ� �̻����� �Է��ϼ���</font>";
		}else if(num == 1){
			msg = "<font color=red>�����ϴ� ���̵��Դϴ�.</font>";;
		}else {
			msg = "<font color=blue>��� ������ ���̵��Դϴ�.</font>";
		}
		
		return msg;
	}
	
	//���̵� ã��
	@GetMapping("/id_search")
	public void idSearchGET() throws Exception {
		logger.info("id search get ...........");
	}
	
	
	@GetMapping("/id_result")
	public void idResultGet(MemberVO member, Model model) throws Exception {
		logger.info("MemberVO member======================"+member);
		logger.info("id result get .................");
		
		member = sqlSession.selectOne(namespace+".idSearch", member);
		
		model.addAttribute("member", member);
	}
	
	//��й�ȣ ã��
	@GetMapping("/pw_search")
	public void pwSearchGET() throws Exception {
		logger.info("pw search get ...........");
	}
	
	@GetMapping("/pw_result")
	public void pwResultGet(MemberVO member, Model model) throws Exception {
		logger.info("MemberVO member======================"+member);
		logger.info("pw result get .................");
		
		member = sqlSession.selectOne(namespace+".pwSearch", member);
		
		model.addAttribute("member", member);
		
		logger.info("pw======================="+member);
	}
	
	//ȸ������
	@GetMapping("/joinup")
	public void joinupGet(HttpSession session, MemberVO member, Model model) throws Exception {
		logger.info("joinup Get=====================");
		
		String session_id = (String)session.getAttribute("id");
		
		member = sqlSession.selectOne(namespace+".join", session_id);
		model.addAttribute("member", member);	
	}
	
	
	@RequestMapping(value = "/joinup", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String joinupPost(MemberVO member, Model model, HttpSession session) throws Exception {
		logger.info("joinup Post =======================");
		
		sqlSession.update(namespace+".updateMember", member);
		
		model.addAttribute("msg", "ȸ�������� �Ϸ�Ǿ����ϴ�.");
		model.addAttribute("url", "/");
		
		session.invalidate();
		
		return "/member/alert";
	}
}
