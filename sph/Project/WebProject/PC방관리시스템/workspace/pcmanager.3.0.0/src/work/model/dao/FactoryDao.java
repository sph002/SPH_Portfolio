package work.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FactoryDao {
	private DataSource ds;
	private static FactoryDao instance = new FactoryDao();
	
	private FactoryDao(){
		try{
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle");
		} catch (NamingException e) {
			System.out.println("Error : "+ e.getMessage());
		}
	}
	
	public static FactoryDao getInstance(){
		return instance;
	}
	
	public Connection getConnection() {
		try {
			return ds.getConnection();
		} catch (SQLException e) {
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}return null;
	}
	
	public void close(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if(rs!=null){
				rs.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(conn!=null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error(자원해제오류) : " + e.getMessage());
		}
	}
	
	public void close(Statement stmt, Connection conn){
		close(null, stmt, conn);
	}
}
