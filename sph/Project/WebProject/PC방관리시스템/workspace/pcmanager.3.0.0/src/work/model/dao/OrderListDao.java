package work.model.dao;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import work.model.dto.OrderList;

public class OrderListDao {

	private FactoryDao factory = FactoryDao.getInstance();
	public Connection getConnection(){
		return factory.getConnection();
	}
	
	// 상품명이 none 이거나 수량이 0으로 입력되어 오는 경우 제거 - 메서드
	public ArrayList<OrderList> orderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String noodle1 = request.getParameter("noodle1");
		String noodle2 = request.getParameter("noodle2");
		String noodle3 = request.getParameter("noodle3");
		String drink1 = request.getParameter("drink1");
		String drink2 = request.getParameter("drink2");
		String drink3 = request.getParameter("drink3");
		String bread1 = request.getParameter("bread1");
		String bread2 = request.getParameter("bread2");
		String bread3 = request.getParameter("bread3");
		
		int noodlecount1 = Integer.parseInt(request.getParameter("noodlecount1"));
		int noodlecount2 = Integer.parseInt(request.getParameter("noodlecount2"));
		int noodlecount3 = Integer.parseInt(request.getParameter("noodlecount3"));
		int drinkcount1 = Integer.parseInt(request.getParameter("drinkcount1"));
		int drinkcount2 = Integer.parseInt(request.getParameter("drinkcount2"));
		int drinkcount3 = Integer.parseInt(request.getParameter("drinkcount3"));
		int breadcount1 = Integer.parseInt(request.getParameter("breadcount1"));
		int breadcount2 = Integer.parseInt(request.getParameter("breadcount2"));
		int breadcount3 = Integer.parseInt(request.getParameter("breadcount3"));

		ArrayList<OrderList> list = new ArrayList<OrderList>();
		
		if (noodle1 != null && noodlecount1 != 0) {
			OrderList dto = new OrderList(noodle1, noodlecount1);
			list.add(dto);
		}
		if (noodle2 != null && noodlecount2 != 0) {
			OrderList dto = new OrderList(noodle2, noodlecount2);
			list.add(dto);
		}
		if (noodle3 != null && noodlecount3 != 0) {
			OrderList dto = new OrderList(noodle3, noodlecount3);
			list.add(dto);
		}
		if (drink1 != null && drinkcount1 != 0) {
			OrderList dto = new OrderList(drink1, drinkcount1);
			list.add(dto);
		}
		if (drink2 != null && drinkcount2 != 0) {
			OrderList dto = new OrderList(drink2, drinkcount2);
			list.add(dto);
		}
		if (drink3 != null && drinkcount3 != 0) {
			OrderList dto = new OrderList(drink3, drinkcount3);
			list.add(dto);
		}
		if (bread1 != null && breadcount1 != 0) {
			OrderList dto = new OrderList(bread1, breadcount1);
			list.add(dto);
		}
		if (bread2 != null && breadcount2 != 0) {
			OrderList dto = new OrderList(bread2, breadcount2);
			list.add(dto);
		}
		if (bread3 != null && breadcount3 != 0) {
			OrderList dto = new OrderList(bread3, breadcount3);
			list.add(dto);
		}
//		System.out.println(list.size());
		return list;
	}
	
}
