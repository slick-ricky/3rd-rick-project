package com.cafe.persistence;

import java.util.List;

import com.cafe.domain.BoardVO;
import com.cafe.domain.Criteria;
import com.cafe.domain.SearchCriteria;

public interface BoardDAO {

	public void create(BoardVO vo) throws Exception;
	
	public BoardVO view(BoardVO vo) throws Exception;
	public BoardVO previous(BoardVO vo) throws Exception;
	public BoardVO next(BoardVO vo) throws Exception;
	
	public void update(BoardVO vo) throws Exception;
	public void delete(BoardVO vo) throws Exception;
	public List<BoardVO> list() throws Exception;
	public List<BoardVO> list2(BoardVO vo) throws Exception;
	
	public List<BoardVO> listPage(int page) throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public void addAttach(String fullName) throws Exception;
	public List<String> getAttach(Integer uid) throws Exception;
}
