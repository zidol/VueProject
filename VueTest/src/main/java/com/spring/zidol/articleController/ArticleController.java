package com.spring.zidol.articleController;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.zidol.service.ArticleService;
import com.spring.zidol.vo.ArticleVO;
import com.spring.zidol.vo.Criteria;
import com.spring.zidol.vo.PageMaker;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@Autowired
	ArticleService articleService;
	
//	//게시글 리스트 호출
//	@RequestMapping(value="/articleList", method = RequestMethod.GET)
//	public String articleList(Model model) throws Exception {
//		
//		List<ArticleVO> articleList = articleService.articleList();
//		model.addAttribute("articleList", new ObjectMapper().writeValueAsString(articleList));
//		logger.info("Article List", articleList);
//		return "/article/articleList";
//	}
	
	//게시글 페이징 리스트 호출
	@RequestMapping(value="/articleList", method = RequestMethod.GET)
	public String articleList(Model model, @ModelAttribute("criteria")Criteria criteria) throws Exception {
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCriteria(criteria);
	    pageMaker.setTotalCount(articleService.countArticles(criteria));
		
	    ObjectMapper mapper = new ObjectMapper();
	    
		List<ArticleVO> articleList = articleService.listCriteria(criteria);
		model.addAttribute("articleList", mapper.writeValueAsString(articleList));
		//model.addAttribute("pageMaker", mapper.writeValueAsString(pageMaker));
		model.addAttribute("pageMaker", pageMaker);
		logger.info("Article List", articleList);
		return "/article/articleList";
	}
		
		
	//게시글 상세 내용 호출
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	public String article(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("article", new ObjectMapper().writeValueAsString(articleService.article(id)));
		logger.info("Article Detail");
		return "/article/articleDetail";
	}
	
	//게시글 작성 페이지 호출
	@RequestMapping(value="/insertArticle", method = RequestMethod.GET)
	public String insertView() throws Exception {
		logger.info("Article Write Page");
		return "/article/insertArticle";
	}
	
	//게시글 작성 호출
	@RequestMapping(value="/insertArticle", method = RequestMethod.POST)
	public String insertArticle(ArticleVO articleVO) throws Exception {
		articleService.insertArticle(articleVO);
		logger.info("Insert Success");
		return "redirect:/article/articleList";
	}
	
	//게시글 수정 호출
	@RequestMapping(value="/updateArticle", method = RequestMethod.POST)
	public String updateArticle(ArticleVO articleVO) throws Exception {
		System.out.println(articleVO);
		articleService.updateArticle(articleVO);
		logger.info("completed update");
		return "redirect:/article/articleList";
	}
	
	//게시글 삭제 
	@RequestMapping(value="/deleteArticle/{id}", method = RequestMethod.GET)
	public String deletgeArticle(@PathVariable("id") int id) throws Exception {
		articleService.deleteArticle(id);
		logger.info("completed delete");
		return "redirect:/article/articleList";
	}
}
