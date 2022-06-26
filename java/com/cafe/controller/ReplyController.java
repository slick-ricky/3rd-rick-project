package com.cafe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.cafe.domain.Criteria;
import com.cafe.domain.PageMaker;
import com.cafe.domain.ReplyVO;
import com.cafe.persistence.ReplyDAO;

@RestController
@RequestMapping("/replies/")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyDAO dao;

	//리턴 타입 ResponseEntity<String> entity 설계
	//새로운 댓글을 등록 실패시 BAD_REQUEST(400)를 결과로 전송된다.
	//JSON으로 전송된 데이터를 ReplyVO타입의 객체(vo)로 변환해주는 역할을 @RequestBody가 한다.

	//글 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo, HttpSession session) {
	    ResponseEntity<String> entity = null;

	    try {
	    	String session_id = (String) session.getAttribute("id");
	    	
	    	vo.setId(session_id);
	    	
	    	dao.create(vo);
	    	logger.info("vo.toString======================="+vo.toString());
	    	
	    	entity = new ResponseEntity<String>("success", HttpStatus.OK);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); //400에러
	    }
	    return entity;
	}
	
	//@RequestMapping()을 보면 URI 내의 경로에 {uid}를 활용한다.
	//{uid}는 메소드의 파라미터에서 @PathVariable("uid")로 활용된다.
	//메소드의 처리가 성공하는 경우 - HttpStatus.OK 헤더를 전송하고, 데이터를 같이 전송처리한다.

	//글 목록
	@RequestMapping(value = "/all/{uid}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("uid") Integer uid) {
		// @PathVariable - URI 경로에서 원하는 데이터를 추출하는 용도로 사용
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(dao.list(uid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//글 수정
	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {

		ResponseEntity<String> entity = null;

		try {
			vo.setRno(rno);
			dao.update(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//글 삭제
	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {
		ResponseEntity<String> entity = null;

		try {
			dao.delete(rno);;
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// - /replies/게시물 번호/페이지 번호
	//페이징 처리를 위해서는 PageMaker를 가져와야 한다.
	//Ajax로 호출될 것이므로 Model 아닌 Map 타입의 객체를 생성 이용한다.

	//페이징 처리
	@RequestMapping(value = "/{uid}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(
		@PathVariable("uid") Integer uid,
		@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;	    
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = dao.listPage(uid, cri);
			map.put("list", list);
			int replyCount = dao.count(uid);
			pageMaker.setTotalCount(replyCount);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
		
}