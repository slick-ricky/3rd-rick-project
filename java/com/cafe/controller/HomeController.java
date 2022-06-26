package com.cafe.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

import com.cafe.domain.ItemVO;
import com.cafe.domain.MyReviewVO;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private SqlSession Sqlsession;
	
	private static final String namespace = "com.cafe.mapper.homeMapper";
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, MyReviewVO vo, ItemVO it) {
		logger.info("===index===");
		
		model.addAttribute("list", Sqlsession.selectList(namespace+".top_review", vo));
		
		model.addAttribute("list2", Sqlsession.selectList(namespace+".newList"));
		
		model.addAttribute("list3", Sqlsession.selectList(namespace+".seasonList"));
		
		return "index";
	}
	
}
