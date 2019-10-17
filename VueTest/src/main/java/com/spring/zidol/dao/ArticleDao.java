package com.spring.zidol.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.zidol.vo.ArticleVO;
import com.spring.zidol.vo.Criteria;

public interface ArticleDao {
	public List<ArticleVO> articleList(ArticleVO articleVo) throws DataAccessException;
	
	void insert(ArticleVO articleVO) throws DataAccessException;
	
	public ArticleVO article(int id) throws DataAccessException;
	
	void update(ArticleVO articleVO) throws DataAccessException;
	
	void delete(int id) throws DataAccessException;
	
	public List<ArticleVO> listCriteria(Criteria criteria) throws DataAccessException;
	
	public int countArticles(ArticleVO articleVO) throws DataAccessException;
	
	public List<ArticleVO> articleListAjax(ArticleVO articleVO) throws DataAccessException;
}
