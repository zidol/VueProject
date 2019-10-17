package com.spring.zidol.articleController;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.zidol.service.ArticleService;
import com.spring.zidol.vo.ArticleVO;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@Autowired
	ArticleService articleService;
	
	//게시글 페이징 리스트 호출
	@RequestMapping(value="/articleList")
	public String articleList(Model model, @ModelAttribute ArticleVO articleVO) throws Exception {
//	    ArticleVO articleVO = new ArticleVO();
		ObjectMapper mapper = new ObjectMapper();
//		articleVO.setCurrentPage(currentPage);
//		articleVO.setPerPage(perPage);
	    List<ArticleVO> articleList = articleService.articleList(articleVO);
	    int articleListRecords = articleService.countArticles(articleVO);
		model.addAttribute("articleList", mapper.writeValueAsString(articleList));
		model.addAttribute("articleListRecords", mapper.writeValueAsString(articleListRecords));
		model.addAttribute("currentPage",articleVO.getCurrentPage());
		logger.info("Article List", articleList);
		return "/article/articleList";
	}
	
	@ResponseBody
	@RequestMapping(value="/articleListAjax", method = RequestMethod.GET)
	public Map<String, Object> articleListAjax(ArticleVO articleVO) throws Exception {
		System.out.println(articleVO.toString());
		logger.info("Article List Ajax", articleVO.toString());
		return articleService.articleListAjax(articleVO);
	}
		
	//게시글 상세 내용 호출
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	public String article(@PathVariable("id") int id, Model model,@ModelAttribute ArticleVO articleVO, @RequestParam int currentPage, @RequestParam int perPage) throws Exception {
		model.addAttribute("article", new ObjectMapper().writeValueAsString(articleService.article(id)));
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("perPage" , perPage);
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
	public String updateArticle(@ModelAttribute ArticleVO articleVO,RedirectAttributes redirectAttributes) throws Exception {
		System.out.println(articleVO);
		articleService.updateArticle(articleVO);
		redirectAttributes.addAttribute("currentPage", articleVO.getCurrentPage());
		redirectAttributes.addAttribute("perPage", articleVO.getPerPage());
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
