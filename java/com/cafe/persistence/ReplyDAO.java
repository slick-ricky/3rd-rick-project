package com.cafe.persistence;

import java.util.List;

import com.cafe.domain.Criteria;
import com.cafe.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> list(Integer uid) throws Exception;
	public void create(ReplyVO vo) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO> listPage(Integer uid, Criteria cri) throws Exception;
	public int count(Integer uid) throws Exception;

}