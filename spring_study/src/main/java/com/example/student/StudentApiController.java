package com.example.student;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/student")
public class StudentApiController {

	final StudentDAO dao;

	@Autowired
	public StudentApiController(StudentDAO dao) {
		this.dao = dao;
	}

	// 학생 등록 API 서비스  POST -  http://localhost:8090/api/student
	@PostMapping
	public String addStudent(@RequestBody Student student) {
		try {
			dao.insert(student);
		} catch (Exception e) {
			e.printStackTrace();
			return "Student API: 학생 등록 실패!!";
		}
		return "Student API: 학생 등록됨!!";
	}

	// 학생 삭제 API 서비스  DELETE  -  /api/student/{sid}
	@DeleteMapping("{sid}")
	public String delStudent(@PathVariable("sid") int sid) {
		try {
			dao.deleteStudent(sid);
		} catch (SQLException e) {
			e.printStackTrace();
			return "Student API: 학생 삭제 실패!! = " + sid;
		}
		return "Student API: 학생 삭제됨!! - " + sid;
	}

	// 학생 목록 조회 API 서비스 GET  -  http://localhost:8090/api/student
	@GetMapping
	public List<Student> getStudentList() {
		List<Student> studentList = null;
		try {
			studentList = dao.getAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentList;
	}

	// 학생 상세 정보 API 서비스 GET -  /api/student/{sid}
	@GetMapping("{sid}")
	public Student getStudent(@PathVariable("sid") int sid) {
		Student student = null;
		try {
			student = dao.getStudent(sid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}
}

