package com.spring.zidol.vo;

import java.util.Date;

public class ArticleVO {
	private int id;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ArticleVO [id=" + id + ", writer=" + writer + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + "]";
	}
	
	
	
}
