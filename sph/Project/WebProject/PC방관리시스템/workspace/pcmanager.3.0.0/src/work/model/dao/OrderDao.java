package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import work.model.dto.Order;
import work.model.dto.OrderList;
import work.model.dto.OrderSummary;

public class OrderDao {

	private FactoryDao factory = FactoryDao.getInstance();
	public Connection getConnection(){
		return factory.getConnection();
	}
	
	/** 전체 주문 현황 목록 조회 */
	public ArrayList<Order> selectList() {
		ArrayList<Order> list = new ArrayList<Order>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from orders";
		try{
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			int orderNo = 0;
			String memberId = null;
			Date orderTime = null;
			Order dto = null;
					
			while(rs.next()) {
				orderNo = rs.getInt("order_no");
				memberId = rs.getString("member_id");
				orderTime = rs.getDate("order_time");
				
				dto = new Order(orderNo, memberId, orderTime);
				list.add(dto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(전체 주문 현황 조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return list;
	}
	
	// select max(order_no) from orders;
	// insert into orders values((select max(order_no)+1 from orders), 'user01', sysdate);
	/** 총 주문 수 조회 */
	public int getMaxOrderNo() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select max(order_no) from orders";
		try{
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error (최대주문번호 조회) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return 0;
	}
	
	/** 
	 * 주문 등록
	 * 1. 회원이 주문을 하면 주문 테이블에 주문번호와 주문시각 생성 
	 * -- 어떤 회원이 : 회원아이디
	 * -- 주문한 목록들을 추가 :주문목록
	 * -- 가장큰 주문번호 조회 + 1 : 주문번호
	 * 
	 * 2. 주문번호에 해당하는 주문목록을 주문목록 테이블에 레코드 생성
	 * 
	 * 3. 주문된 상품과 그 수량을 상품 테이블의 재고 컬럼 수정
	 * */
	public int insertOrder(String memberId, ArrayList<OrderList> list) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		int orderNo = getMaxOrderNo() + 1;
		String sql = "insert into orders values(?, ?, ?)";
		String sql2 = "insert into order_lists values (?, ?, ?)";
		String sql3 = " update products set stock = (stock - ?) where product_name = ? ";
		
		try{
			conn = getConnection();
			
			// 주문서 레코드 추가
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orderNo);
			stmt.setString(2, memberId);
			java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			stmt.setDate(3, date);
			stmt.executeUpdate();
			
			// 주문목록 반복 레코드 추가 : 배치
			stmt = conn.prepareStatement(sql2);
			int successOrderBatch = 0;
			if (list.size() == 1) {
				stmt.setInt(1, orderNo);
				stmt.setString(2, list.get(0).getProductName());
				stmt.setInt(3, list.get(0).getProductCount());
				
				successOrderBatch = stmt.executeUpdate();
				
			} else {
				for (OrderList dto : list) {
					stmt.setInt(1, orderNo);
					stmt.setString(2, dto.getProductName());
					stmt.setInt(3, dto.getProductCount());
					stmt.addBatch();	// 배치에 등록 sql 추가
				}
				successOrderBatch = stmt.executeBatch()[1];
			}

			stmt = conn.prepareStatement(sql3);
			for (OrderList dto : list) {
				stmt.setInt(1, dto.getProductCount());
				stmt.setString(2, dto.getProductName());
				stmt.addBatch();
			}
			stmt.executeBatch();  // 배치에 등록되어 있는 추가 sql 한번에 전체 수행
			
			return successOrderBatch;
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(주문 등록 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return 0;
	}
	
	public ArrayList<OrderSummary> orderView() {
		ArrayList<OrderSummary> list = new ArrayList<OrderSummary>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		int orderNo = getMaxOrderNo();
		String sql = "select * from order_summary where 주문번호 = ?";
		
		try{
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orderNo);
			rs = stmt.executeQuery();			
			
			OrderSummary dto = null;
					
			while(rs.next()) {
				String productName = rs.getString("상품명");
				int productCount = rs.getInt("주문수량");
				int price = rs.getInt("청구금액");

				dto = new OrderSummary(productName, productCount, price);
				list.add(dto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(주문 청구내역 조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return list;
	}
}
