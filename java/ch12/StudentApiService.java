package ch12;

import ch09.Student;
import ch09.StudentDAO;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Produces;
import java.util.List;

@Path("/student")
public class StudentApiService {
    StudentDAO dao;

    public StudentApiService() {
        dao = new StudentDAO();
    }

    // 학생등록
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public String addStudent(Student student) {
        try {
            dao.insert(student);
        } catch (Exception e) {
            e.printStackTrace();
            return "Student API: 학생 등록 실패!!";
        }
        return "Student API: 학생 등록됨!!";
    }

    // 학생목록
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Student> getStudents() {
        List<Student> studentList = null;
        try {
            studentList = dao.getAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentList;
    }


    // 학생 삭제
    @DELETE
    @Path("/{id}")
    public String deleteStudent(@PathParam("id") int id) {
        try {
            dao.deleteStudent(id);
            
        } catch (Exception e) {
            e.printStackTrace();
            
            return "Student API: 학생 삭제 실패!!";
        }
        return "Student API: 학생 삭제됨!!";
    }

    // 학생 상세 정보
    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Student getStudent(@PathParam("id") int id) {
        Student student = null;
        try {
            student = dao.getStudent(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }
}