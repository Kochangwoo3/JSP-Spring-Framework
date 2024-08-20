package com.example.news;

import java.util.List;

public class NewsDTO {
	private List<News> news;
	private Object paging;
	
	public List<News> getNews() {
		return news;
	}
	public void setNews(List<News> news) {
		this.news = news;
	}
	
	public Object getPaging() {
		return paging;
	}
	public void setPaging(Object paging) {
		this.paging = paging;
	}
	
	
}
