package com.cafe.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cafe.domain.BoardVO;
import com.cafe.domain.Criteria;
import com.cafe.domain.SearchCriteria;

@Repository //BoardDAO 를 스프링 구조에 인식 시키겠다라고 선언
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.cafe.mapper.BoardMapper";
	
	@Transactional
	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace+".create", vo);
		
		//파일첨부
		String[] files = vo.getFiles();		
		if(files == null) { return; }		

		for(String fileName : files) {
			session.insert(namespace+".addAttach",fileName);
		}
	}
	
	@Override
	public BoardVO view(BoardVO vo) throws Exception {
		session.update(namespace+".updateCnt", vo);
		return session.selectOne(namespace+".view", vo);
	}
	
	@Override
	public BoardVO previous(BoardVO vo) throws Exception {
		return session.selectOne(namespace+".previous", vo);
	}
	
	@Override
	public BoardVO next(BoardVO vo) throws Exception {
		return session.selectOne(namespace+".next", vo);
	}
	
	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}
	
	@Override
	public void delete(BoardVO vo) throws Exception {
		session.delete(namespace+".delete", vo);
	}
	
	@Override
	public List<BoardVO> list() throws Exception {

		return session.selectList(namespace+".list");
	}
	
	@Override
	public List<BoardVO> list2(BoardVO vo) throws Exception {

		return session.selectList(namespace+".list2", vo);
	}
	
	@Override //추가
	public List<BoardVO> listPage(int page) throws Exception {
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;	
		
		return session.selectList(namespace+".listPage", page);
	}
	
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount", cri);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception {
		session.insert(namespace+".addAttach",fullName);
	}
	
	@Override
	public List<String> getAttach(Integer uid) throws Exception {
		return session.selectList(namespace+".getAttach", uid);
	}
}
