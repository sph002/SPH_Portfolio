package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import work.model.dto.Seat;
import work.model.dto.UseList;
import work.util.Utility;

public class SeatDao {


	private FactoryDao factory = FactoryDao.getInstance();
	
	public Connection getConnection(){
		return factory.getConnection();
	}
	
	public ArrayList<Seat> selectList(){
		ArrayList<Seat> list = new ArrayList<Seat>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from seats";
		
		try {
			conn = getConnection(); 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		
			int seatNo;
			String memberId;
		    int condition;
			String startTime;
			String finishTime;
			String maxTime;
			String monitor;
			String mainframe;
			
			while(rs.next()){
				seatNo = rs.getInt("seat_no");
				memberId = rs.getString("member_id");
			    condition = rs.getInt("condition");
				startTime = rs.getString("start_time");
				finishTime = rs.getString("finish_time");
				maxTime = rs.getString("max_time");
				monitor = rs.getString("monitor");
				mainframe= rs.getString("mainframe");
				
				Seat tmp = new Seat(seatNo,memberId,condition,startTime,finishTime,maxTime,monitor,mainframe);
				list.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(전체좌석조회오류) : " + e.getMessage());
		} finally{
			factory.close(rs,stmt,conn);
		}
		return list;
	}
	//켜진 컴퓨터수 조회
	public int onNumber(){
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from seats where condition=1";
		int number=-1;
		try {
			conn = getConnection(); 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				number = rs.getInt("COUNT(*)");
				return number;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(전체좌석조회오류) : " + e.getMessage());
		} finally{
			factory.close(rs,stmt,conn);
		}
		return number;
	}
	public int offNumber(){
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from seats where condition=0";
		int number=-1;
		try {
			conn = getConnection(); 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				number = rs.getInt("COUNT(*)");
				return number;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(전체좌석조회오류) : " + e.getMessage());
		} finally{
			factory.close(rs,stmt,conn);
		}
		return number;
	}

	public int insertUseList(UseList dto){

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "insert into use_lists values(?, ?, ?, ?, ?)";
		String memberId;
		int seatNo;
		int useTime;
		int cost;
		
		java.sql.Date payTime = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, dto.getMemberId());
			stmt.setInt(2, dto.getSeatNo());
			stmt.setInt(3, dto.getUseTime());
			stmt.setInt(4, dto.getCost());
			stmt.setDate(5,payTime);
			
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(결제내역추가 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return 0;
	}
	public Seat selectOne(int seatNo){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from seats where seat_no=?";
		
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, seatNo);
			rs = stmt.executeQuery();
			
			String memberId;
			int condition;
			String startTime;
			String finishTime;
			String maxTime;
			String monitor;
			String mainframe;
			Seat tmp =null;
			while(rs.next()) {
			
				memberId = rs.getString("member_id");
				condition =rs.getInt("condition");
				startTime = rs.getString("start_time");
				finishTime =rs.getString("finish_time");
				maxTime =rs.getString("max_time");
				monitor =rs.getString("monitor");
				mainframe=rs.getString("mainframe");
				
				tmp= new Seat(seatNo,memberId,condition,startTime,finishTime,maxTime,monitor,mainframe);
				return tmp;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(자리조회오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return null;
	}
		
	public Seat selectOne(String memberId){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from seats where member_id=?";
		
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberId);
			rs = stmt.executeQuery();
			
			int seatNo;
			int condition;
			String startTime;
			String finishTime;
			String maxTime;
			String monitor;
			String mainframe;
			Seat tmp =null;
			while(rs.next()) {
			
				seatNo = rs.getInt("seat_no");
				condition =rs.getInt("condition");
				startTime = rs.getString("start_time");
				finishTime =rs.getString("finish_time");
				maxTime =rs.getString("max_time");
				monitor =rs.getString("monitor");
				mainframe=rs.getString("mainframe");
				
				tmp= new Seat(seatNo,memberId,condition,startTime,finishTime,maxTime,monitor,mainframe);
				return tmp;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(자리조회오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return null;
	}
	
	public int Update(int seatNo, String memberId, int useTime){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//UPDATE 테이블명 SET 컬럼명1=변경값 , 컬럼명N=값;
		StringBuilder sql = new StringBuilder();
		sql.append("update seats set member_id=?, condition=?,start_time=sysdate, finish_time=null ,max_time=sysdate+1/(24*60)*? where seat_no=?");
		int condition=1;
		
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, memberId);
			stmt.setInt(2, condition);
			stmt.setInt(3,useTime);
			stmt.setInt(4, seatNo);
			
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(결제 후 좌석정보변경 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return 0;
	}
	public int Update(int seatNo){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//UPDATE 테이블명 SET 컬럼명1=변경값 , 컬럼명N=값;
		StringBuilder sql = new StringBuilder();
		sql.append("update seats set member_id='admin', condition=0,start_time=null, finish_time=null ,max_time=null where seat_no=?");

		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql.toString());
			stmt.setInt(1, seatNo);
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(로그아웃시 seat 업데이트오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return 0;
	}
	

	public String selectStartTime(int seatNo){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select to_char(start_time,'yyyy-mm-dd hh:mi:ss') from seats where seat_no=?";
		
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, seatNo);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String startTime = rs.getString(1);
				return startTime;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(시작시간조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return null;
	}

	public String selectFinishTime(int seatNo){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select to_char(max_time,'yyyy-mm-dd hh:mi:ss') from seats where seat_no=?";
		
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, seatNo);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String finishTime = rs.getString(1);
				return finishTime;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(종료시간조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return null;
	}
	public int remainTime(int seatNo){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select round(60*24*(max_time-sysdate)) from seats where seat_no=?";
		
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, seatNo);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				int remainTime = rs.getInt(1);
				return remainTime;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(시작시간조회 오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return 0;
	}
	
	public int updateCondition(int seatNo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//String sql = "insert into members values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		StringBuilder sql = new StringBuilder();
		sql.append("update seats set condition=? where seat_no=?");
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql.toString());
			stmt.setInt(1, 0);
			stmt.setInt(2, seatNo);
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(좌석컨디션업데이트오류) : " + e.getMessage());
		} finally {
			factory.close(rs, stmt, conn);
		}
		
		return 0;
	}

	
	
}
	

