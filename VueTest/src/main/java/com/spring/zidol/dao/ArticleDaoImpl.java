package com.spring.zidol.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.zidol.vo.ArticleVO;
import com.spring.zidol.vo.Criteria;

@Repository
public class ArticleDaoImpl implements ArticleDao {
	@Autowired
	private SqlSession sqlsession;
	
	private static final String MP = "mapper.article";
	
	private static final String SELECT_ALL = MP + ".listAll";
	private static final String SELECT_CRITERIA = MP + ".listCriteria";
	private static final String SELECT_DETAIL = MP + ".article";
	private static final String SELECT_COUNTARTICLES = MP + ".countArticles";
	private static final String CREATE = MP + ".create";
	private static final String UPDATE = MP + ".update";
	private static final String DELETE = MP + ".delete";
	
	@Override
	public List<ArticleVO> articleList(ArticleVO articleVO) throws DataAccessException {
		List<ArticleVO> articleList = sqlsession.selectList(SELECT_CRITERIA, articleVO);
		return articleList;
	}

	@Override
	public void insert(ArticleVO articleVO) throws DataAccessException {
		sqlsession.insert(CREATE, articleVO);
	}

	@Override
	public ArticleVO article(int id) throws DataAccessException {
		return sqlsession.selectOne(SELECT_DETAIL, id);
	}

	@Override
	public void update(ArticleVO articleVO) throws DataAccessException {
		sqlsession.update(UPDATE, articleVO);
	}

	@Override
	public void delete(int id) throws DataAccessException {
		sqlsession.delete(DELETE, id);
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws DataAccessException {
		return sqlsession.selectList(SELECT_CRITERIA, criteria);
	}

	@Override
	public int countArticles(ArticleVO articleVO) throws DataAccessException {
		return sqlsession.selectOne(SELECT_COUNTARTICLES, articleVO);
	}

	@Override
	public List<ArticleVO> articleListAjax(ArticleVO articleVO) throws DataAccessException {
		return sqlsession.selectList(SELECT_CRITERIA, articleVO);
	}

}
