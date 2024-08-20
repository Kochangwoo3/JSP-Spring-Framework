package com.example.news;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;

@RestController
@RequestMapping("/api/news")
public class NewsApiController {

	final NewsDAO dao;
	
	@Autowired
	public NewsApiController(NewsDAO dao) {
		this.dao = dao;
	}
	
	// 프로퍼티 파일로 부터 저장 경로 참조
	@Value("${news.img.dir}")
	String fdir;
	
	// 뉴스 등록 api 서비스  POST -  http://localhost:8090/api/news
//	@PostMapping
//	public String addNews(@RequestBody News news) {
//		
//		try {
//			dao.addNews(news);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "News API: 뉴스 등록 실패!!";
//		}
//		
//		return "News API: 뉴스 등록됨!!";
//	}
	
	//  파일 등록 api 서비스
	@PostMapping
	public String addNews(@ModelAttribute News news) {
		try {
			// 1. 저장 파일 객체 생성
			// 1. 저장 파일 객체 생성
			String fileName = news.getImgFile().getOriginalFilename();
			
			String sysName = System.currentTimeMillis() + 
					fileName.substring(fileName.lastIndexOf("."));
			File dest = new File(fdir + "/" + sysName);			
			news.getImgFile().transferTo(dest);   //  서버 경로에 파일 쓰기
			
			news.setImg("/img/" + dest.getName());
			
			dao.addNews(news);
		} catch (Exception e) {
			e.printStackTrace();
			return "News API: 뉴스 등록 실패!!";
		}
		
		return "News API: 뉴스 등록됨!!";
	}
	
	@PostMapping("{aid}")
	public News updateNews(@PathVariable("aid") int aid, 
			@ModelAttribute News news) {
		try {
			if (news.getImgFile() != null &&  !news.getImgFile().isEmpty()) {
				File dest = new File(fdir+ "/" + news.getImgFile().getOriginalFilename());
				// 파일 저장
				news.getImgFile().transferTo(dest);
				// News db에 파일 이름 지정
				news.setImg("/img/" + dest.getName());
				
			} else {
				News orgNews = dao.getNews(aid); 
				news.setImg(orgNews.getImg());
			}
			news.setAid(aid);
			dao.updateNews(news);
			
		} catch (Exception e) {
			e.printStackTrace();
			return news;
			// return "News 수정 실패 ";
		}
		// return "News 수정됨";
		return news;
	}
	
	// 뉴스 삭제 api 서비스  DELETE  -  /api/news/4
	@PostMapping("/del/{aid}")
	public String delNews(@PathVariable("aid") int aid) {
		
		try {
			dao.delNews(aid);
		} catch (Exception e) {
			e.printStackTrace();
			return "News API: 뉴스 삭제 실패!! = " + aid ;
		}
		
		return "News API: 뉴스 삭제됨!! - " + aid;
	}
	
	// 뉴스 목록 조회 api 서비스 GET  +  http://localhost:8090/api/news/all
	@GetMapping("/all")
	public List<News> getNewsList(){
		List<News> newsList = null;
		
		try {
			newsList = dao.getAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsList;
	}
	
	// 뉴스 목록 조회  /api/news?order="aid"&offset=0&limit=6
	@GetMapping
	public NewsDTO getNewsList(
		@RequestParam(value="order", required=false) String order,
		@RequestParam(value="offset", required=false) int offset,
		@RequestParam(value="limit", required=false) int limit
	) {
		NewsDTO rList = new NewsDTO(); //데이터목로과 페이징정보 전송객체
		List<News> newsList = null;
		List<News> newsListAll = null;  //전체목록
		try {
			newsListAll = dao.getAll();
			int totalSize = newsListAll.size();  // 총데이타 건수 13
			
			newsList = dao.getAll(order, offset, limit);  // 페이지데이타정보
			rList.setNews(newsList);
			
			JsonObject obj = new JsonObject();
			obj.addProperty("count", newsList.size());
			
			// 다음 페이지 유무  12, 6  > 13
			if((offset+limit) >= totalSize) {
				obj.addProperty("hasNext", false);
			} else {
				// 0 + 6
				obj.addProperty("hasNext", true);
			}
			
			rList.setPaging(obj.toString());
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return rList;
	}
	
	
	// 뉴스 상세 정보 api 서비스
	@GetMapping("{aid}")
	public News getNews(@PathVariable("aid") int aid) {
		News news = null;
		
		try {
			news = dao.getNews(aid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return news;
		
	}
	
	
}
