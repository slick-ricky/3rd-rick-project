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

	//���� Ÿ�� ResponseEntity<String> entity ����
	//���ο� ����� ��� ���н� BAD_REQUEST(400)�� ����� ���۵ȴ�.
	//JSON���� ���۵� �����͸� ReplyVOŸ���� ��ü(vo)�� ��ȯ���ִ� ������ @RequestBody�� �Ѵ�.

	//�� ���
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
	    	entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); //400����
	    }
	    return entity;
	}
	
	//@RequestMapping()�� ���� URI ���� ��ο� {uid}�� Ȱ���Ѵ�.
	//{uid}�� �޼ҵ��� �Ķ���Ϳ��� @PathVariable("uid")�� Ȱ��ȴ�.
	//�޼ҵ��� ó���� �����ϴ� ��� - HttpStatus.OK ����� �����ϰ�, �����͸� ���� ����ó���Ѵ�.

	//�� ���
	@RequestMapping(value = "/all/{uid}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("uid") Integer uid) {
		// @PathVariable - URI ��ο��� ���ϴ� �����͸� �����ϴ� �뵵�� ���
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(dao.list(uid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//�� ����
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

	//�� ����
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

	// - /replies/�Խù� ��ȣ/������ ��ȣ
	//����¡ ó���� ���ؼ��� PageMaker�� �����;� �Ѵ�.
	//Ajax�� ȣ��� ���̹Ƿ� Model �ƴ� Map Ÿ���� ��ü�� ���� �̿��Ѵ�.

	//����¡ ó��
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