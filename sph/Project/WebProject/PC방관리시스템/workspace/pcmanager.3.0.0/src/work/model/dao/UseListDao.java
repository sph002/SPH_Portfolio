package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import work.model.dto.UseList;

public class UseListDao {
	private FactoryDao factory = FactoryDao.getInstance();
	public Connection getConnection(){
		return factory.getConnection();
	}
	
	/** 일별 좌석 이용 내역 조회 */
	public ArrayList<UseList> selectList(String date) {
		ArrayList<UseList> list = new ArrayList<UseList>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from use_lists where pay_time=?";
		try{
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, date);
			rs = stmt.executeQuery();
			
			String memberId = null;
			int seatNo = 0;
			int useTime = 0;
			int cost = 0;
			Date payTime = null;
			UseList dto = null ;
			
			while(rs.next()) {
				memberId = rs.getString("member_id");
				seatNo = rs.getInt("seat_no");
				useTime = rs.getInt("use_time");
				cost = rs.getInt("cost");
				payTime = rs.getDate("pay_time");
				
				dto = new UseList(memberId, seatNo, useTime, cost, payTime);
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
	
	/** 전체 좌석 사용 내역 조회 */
	public ArrayList<UseList> selectList() {
		ArrayList<UseList> list = new ArrayList<UseList>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from use_lists";
		try{
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			String memberId = null;
			int seatNo = 0;
			int useTime = 0;
			int cost = 0;
			Date payTime = null;
			UseList dto = null ;
			
			while(rs.next()) {
				memberId = rs.getString("member_id");
				seatNo = rs.getInt("seat_no");
				useTime = rs.getInt("use_time");
				cost = rs.getInt("cost");
				payTime = rs.getDate("pay_time");
				
				dto = new UseList(memberId, seatNo, useTime, cost, payTime);
				list.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Error(전체 상세 좌석내역 조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		return list;
	}
}
