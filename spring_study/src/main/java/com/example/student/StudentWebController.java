package com.example.student;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentWebController {
   final StudentDAO dao;
   private final Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired
   public StudentWebController(StudentDAO dao) {
      this.dao = dao;
   }
   
   //학생 추가
   // /student/add
   @PostMapping("/add")
   public String addStudent(@ModelAttribute Student student, Model m) {
       try {
         dao.insert(student);
         
       } catch (Exception e) {
          e.printStackTrace();
          logger.info("학생 추가 과정에서 문제 발생!!");
          m.addAttribute("error", "학생이 정상적으로 등록되지 않았습니다!!");   
          
       }
       return "redirect:/student/list";

   }
   
   //학생 삭제
   // /student/delete/${student.aid}
   @GetMapping("/delete/{id}")
   public String deleteStudent(@PathVariable("id") int id, Model m) {
      
     try {
      dao.deleteStudent(id);
     } catch(Exception e) {
        e.printStackTrace();
        logger.info("학생 삭제 과정에서 문제 발생!!");
        m.addAttribute("error", "학생정보가 정상적으로 삭제되지 않았습니다!!");
     }
      return "redirect:/student/list";
   }
   
   //학생 목록보기
   @GetMapping("/list")
   public String listStudent(Model m) {
      List<Student> list;
      
   try {   
      list = dao.getAll();
      m.addAttribute("students", list);
   } catch (Exception e) {
      e.printStackTrace();
      logger.error("학생 목록 생성 과정에서 문제 발생!!");
      m.addAttribute("error", "학생 목록이 정상적으로 처리되지 않았습니다.");
   }
      return "student/studentList";
      
   }
}



