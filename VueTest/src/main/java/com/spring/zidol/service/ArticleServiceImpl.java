package com.spring.zidol.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.zidol.dao.ArticleDao;
import com.spring.zidol.vo.ArticleVO;
import com.spring.zidol.vo.Criteria;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	ArticleDao articleDao;
	
	
	//게시글 리스트
//	@Override
//	public List<ArticleVO> articleList() throws Exception{
//		return articleDao.articleList();
//	}

	//게시글 작성
	@Override
	public void insertArticle(ArticleVO articleVO) throws Exception {
		articleDao.insert(articleVO);
	}

	//게시글 상세 내용
	@Override
	public ArticleVO article(int id) throws Exception {
		return articleDao.article(id);
	}

	//게시글 수정
	@Override
	public void updateArticle(ArticleVO articleVO) throws Exception {
		articleDao.update(articleVO);
	}
	
	//게시글 삭제
	@Override
	public void deleteArticle(int id) throws Exception {
		articleDao.delete(id);
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		return articleDao.listCriteria(criteria);
	}

	@Override
	public int countArticles(ArticleVO articleVO) throws Exception {
		return articleDao.countArticles(articleVO);
	}

	@Override
	public List<ArticleVO> articleList(ArticleVO articleVO) throws Exception {
		return articleDao.articleList(articleVO);
	}

	@Override
	public Map<String, Object> articleListAjax(ArticleVO articleVO) throws Exception {
		List<ArticleVO> articleList = articleDao.articleListAjax(articleVO);
		
		int articleListRecords = countArticles(articleVO);
		Map<String, Object> dataSetListMap = new HashMap<String, Object>();
		
		dataSetListMap.put("articleList", articleList);
		dataSetListMap.put("articleListRecords", articleListRecords);
		return dataSetListMap;
	}

}
