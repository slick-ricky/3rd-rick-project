package com.cafe.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cafe.domain.Criteria;
import com.cafe.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.cafe.mapper.ReplyMapper";

	@Override
	public List<ReplyVO> list(Integer uid) throws Exception {
		return session.selectList(namespace+".list", uid);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		session.delete(namespace+".delete", rno);
	}
	
	@Override
	public List<ReplyVO> listPage(Integer uid, Criteria cri) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();

	    paramMap.put("uid", uid);
	    paramMap.put("cri", cri);

	    return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(Integer uid) throws Exception {
		return session.selectOne(namespace + ".count", uid);
	}

}