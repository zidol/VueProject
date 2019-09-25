package com.spring.zidol.service;

import java.util.List;

import com.spring.zidol.vo.ArticleVO;
import com.spring.zidol.vo.Criteria;

public interface ArticleService {
	//게시글 리스트
	List<ArticleVO> articleList() throws Exception;
	
	//게시글 상세내용
	ArticleVO article(int id) throws Exception;
	
	//게시글 작성
	void insertArticle(ArticleVO articleVO) throws Exception;
	
	//게시글 수정
	void updateArticle(ArticleVO articleVO) throws Exception;
	
	//게시글 삭제
	void deleteArticle(int id) throws Exception;
	
	//게시글 페이징 처리 조회
	List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	
	//게시글 총 수 조회
	int countArticles(Criteria criteria) throws Exception;
}
