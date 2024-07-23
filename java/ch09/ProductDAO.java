package ch09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	
	Connection conn = null;
	PreparedStatement pstmt;
	
	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	
	public void open() {
		try {
			//1. JDBC 드라이버 로드
			Class.forName(JDBC_DRIVER);
			//2. 데이터베이스 연결
			conn = DriverManager.getConnection(JDBC_URL, "jwbook", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
		
	public List<Product> getAll() {
		open();
		List<Product> products = new ArrayList<>();
		
		try {
			//3. preparedStatement 생성
			pstmt = conn.prepareStatement("select * from product");
			//4. sql문 전송
			ResultSet rs = pstmt.executeQuery();
			//5. 결과값 처리
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setItemname(rs.getString("itemname"));
				p.setMaker(rs.getString("maker"));
				p.setPrice(rs.getInt("price"));
				p.setRegdate(rs.getDate("regdate"));
				
				products.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return products;
	}

	public void insert(Product p) {
		open();
		String sql = "INSERT INTO product(itemname, maker, price, regdate) values(?, ?, ?, ?) ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getItemname());
			pstmt.setString(2, p.getMaker());
			pstmt.setInt(3, p.getPrice());
			pstmt.setDate(4, p.getRegdate());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public Product find(String id) {
		open();
		Product p = new Product();
		
		try {
			pstmt = conn.prepareStatement("select * from product where id = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				p.setId(rs.getInt("id"));
				p.setItemname(rs.getString("itemname"));
				p.setMaker(rs.getString("maker"));
				p.setPrice(rs.getInt("price"));
				p.setRegdate(rs.getDate("regdate"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return p;
	}

	public void update(Product p) {
		open();
		String sql = "UPDATE product SET itemname = ?, maker = ?, price = ?, regdate = ?  ";
		       sql += " WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getItemname());
			pstmt.setString(2, p.getMaker());
			pstmt.setInt(3, p.getPrice());
			pstmt.setDate(4, p.getRegdate());
			pstmt.setInt(5, p.getId());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	
}
