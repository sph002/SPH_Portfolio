package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.OrderSummary;

public class OrderSummaryDao {
	private FactoryDao factory = FactoryDao.getInstance();
	public Connection getConnection(){
		return factory.getConnection();
	}
	
	/** 일별 전체 판매 상품 내역 조회 */
	public ArrayList<OrderSummary> selectListDetail(String date) {
		ArrayList<OrderSummary> list = new ArrayList<OrderSummary>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from order_summary where 주문번호 in(select order_no from orders where order_time=?)";
		try{
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, date);
			rs = stmt.executeQuery();
			
			int orderNo = 0;
			String memberId = null;
			String productName = null;
			int productCount = 0;
			int price = 0;
			OrderSummary dto = null;
			
			while(rs.next()) {
				orderNo = rs.getInt("주문번호");
				memberId = rs.getString("회원명");
				productName = rs.getString("상품명");
				productCount = rs.getInt("주문수량");
				price = rs.getInt("청구금액");
				
				dto = new OrderSummary(orderNo, memberId, productName, productCount, price);
				list.add(dto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(일별 상세 주문내역 조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return list;
	}
	
	/** 주문 번호 별 구매목록 상세 조회 */
	public ArrayList<OrderSummary> selectListDetail(int orderNo) {
		ArrayList<OrderSummary> list = new ArrayList<OrderSummary>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from order_summary where 주문번호 = ?";
		try{
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orderNo);
			rs = stmt.executeQuery();
			
			String memberId = null;
			String productName = null;
			int productCount = 0;
			int price = 0;
			OrderSummary dto = null;
			
			while(rs.next()) {
				memberId = rs.getString("회원명");
				productName = rs.getString("상품명");
				productCount = rs.getInt("주문수량");
				price = rs.getInt("청구금액");
				
				dto = new OrderSummary(orderNo, memberId, productName, productCount, price);
				list.add(dto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(주문번호별 상세 주문내역 조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return list;
	}
	
	/** 전체 판매 상품 내역 조회 */
	public ArrayList<OrderSummary> selectListDetail() {
		ArrayList<OrderSummary> list = new ArrayList<OrderSummary>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from order_summary";
		try{
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			int orderNo = 0;
			String memberId = null;
			String productName = null;
			int productCount = 0;
			int price = 0;
			OrderSummary dto = null;
			
			while(rs.next()) {
				orderNo = rs.getInt("주문번호");
				memberId = rs.getString("회원명");
				productName = rs.getString("상품명");
				productCount = rs.getInt("주문수량");
				price = rs.getInt("청구금액");
				
				dto = new OrderSummary(orderNo, memberId, productName, productCount, price);
				list.add(dto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(전체 상세 주문내역 조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return list;
	}
}
