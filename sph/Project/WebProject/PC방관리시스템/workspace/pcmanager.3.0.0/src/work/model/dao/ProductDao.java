package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import work.model.dto.Product;

public class ProductDao {

	private FactoryDao factory = FactoryDao.getInstance();
	public Connection getConnection(){
		return factory.getConnection();
	}
	
	/** 전체 상품 목록 조회 */
	public ArrayList<Product> selectList() {
		ArrayList<Product> list = new ArrayList<Product>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from products order by category";
		try{
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			String productName = null;
			int stock = 0;
			int priceBuy = 0;
			int priceSell = 0;
			String category = null;
			Product dto = null;
					
			while(rs.next()) {
				productName = rs.getString("product_Name");
				stock = rs.getInt("stock");
				priceBuy = rs.getInt("price_Buy");
				priceSell = rs.getInt("price_Sell");
				category = rs.getString("category");
				
				dto = new Product(productName, stock, priceBuy, priceSell, category);
				list.add(dto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(전체 상품 조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return list;
	}
	
	
	/** 품목별 상품 조회 */
	public ArrayList<Product> selectList(String category) {
		ArrayList<Product> list = new ArrayList<Product>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from products where category = ?";
		try{
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, category);
			rs = stmt.executeQuery();
			
			String productName = null;
			int stock = 0;
			int priceBuy = 0;
			int priceSell = 0;
			Product dto = null;
					
			while(rs.next()) {
				productName = rs.getString("product_Name");
				stock = rs.getInt("stock");
				priceBuy = rs.getInt("price_Buy");
				priceSell = rs.getInt("price_Sell");
				
				dto = new Product(productName, stock, priceBuy, priceSell, category);
				list.add(dto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(품목별 상품조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return list;
	}
	
	
}
