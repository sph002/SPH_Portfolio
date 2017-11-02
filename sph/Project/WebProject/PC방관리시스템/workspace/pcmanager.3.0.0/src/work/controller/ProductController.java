package work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work.model.dao.OrderDao;
import work.model.dao.OrderListDao;
import work.model.dao.OrderSummaryDao;
import work.model.dao.ProductDao;
import work.model.dao.UseListDao;
import work.model.dto.Order;
import work.model.dto.OrderList;
import work.model.dto.OrderSummary;
import work.model.dto.Product;
import work.model.dto.UseList;

/**
 * Servlet implementation class ProductController
 */
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductDao daoP = new ProductDao();
	private OrderDao daoO = new OrderDao();
	private OrderListDao daoOL = new OrderListDao();
	private OrderSummaryDao daoOS = new OrderSummaryDao();
	private UseListDao daoUL = new UseListDao();
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("\n## action : " + action);
		
		switch(action) {
			case "order":
				order(request, response);
//				orderList(request, response);
				break;
			case "getProductAll":
				getProductAll(request, response);
				break;
			case "getCategoryAll":
				getCategoryAll(request, response);
				break;
			case "getOrderAll":
				getOrderAll(request, response);
				break;
			case "getOrderListDetail":
				getOrderListDetail(request, response);
				break;
			case "getSale":
				getSale(request, response);
				break;
			case "getSaleDaily":
				getSaleDaily(request, response);
				break;
			default:
				break;
		}	
		
	}
	
	/** 일별 매출 조회*/
	protected void getSaleDaily(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				String date= request.getParameter("day").toString();
				System.out.println(date);
				ArrayList<OrderSummary> list1 = daoOS.selectListDetail(date);
				request.setAttribute("list1", list1);
				ArrayList<UseList> list2 = daoUL.selectList(date);
				request.setAttribute("list2", list2);
				request.getRequestDispatcher("product/saleList.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 매출 조회*/
	protected void getSale(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				ArrayList<OrderSummary> list1 = daoOS.selectListDetail();
				request.setAttribute("list1", list1);
				ArrayList<UseList> list2 = daoUL.selectList();
				request.setAttribute("list2", list2);
				request.getRequestDispatcher("product/saleList.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 주문번호별 주문내역 상세 조회 */
	protected void getOrderListDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				String orderNo = request.getParameter("orderNo");
				System.out.println("orderNo : " + orderNo);
				ArrayList<OrderSummary> list = daoOS.selectListDetail(Integer.parseInt(orderNo));
				request.setAttribute("list", list);
				request.getRequestDispatcher("product/orderListDetail.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 주문서 목록 조회 */
	protected void getOrderAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				ArrayList<Order> list = daoO.selectList();
				request.setAttribute("list", list);
				request.getRequestDispatcher("product/orderList.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 폼목별 상품 목록 조회 */
	protected void getCategoryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				String category = request.getParameter("category");
				ArrayList<Product> list = daoP.selectList(category);
				request.setAttribute("list", list);
				request.getRequestDispatcher("product/productList.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 전체 상품 목록 조회 */
	protected void getProductAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				ArrayList<Product> list = daoP.selectList();
				request.setAttribute("list", list);
				request.getRequestDispatcher("product/productList.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/** 고객이 상품 주문 */
	protected void order(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션이 있으면서 일반회원인경우 주문 진행
		if (authenticationCheck(request, response)) {
			String memberId = request.getSession(false).getAttribute("memberId").toString();
			
			// 상품명이 none 이거나 수량이 0으로 입력되어 오는 경우 제거 후 리스트 작성 - 메서드
			ArrayList<OrderList> orderList = daoOL.orderList(request, response);
//			System.out.println(orderList.toString());
//			System.out.println(orderList.size());
			
			//주문상품이 있는지 check
			if (orderList.size() != 0 ) {
				// orders, order_lists DB에 데이터 삽입 및 products 재고 수정- 메서드 통해서 디비 insert
				daoO.insertOrder(memberId, orderList);
//				System.out.println(daoO.insertOrder(memberId, orderList)); // -2는 전체가 정상 수행이라는 뜻!!
				
				// order_summary 뷰 조회 해서 결과창 디스패치 - view select 메서드
				ArrayList<OrderSummary> orderSummary = daoO.orderView();
//				System.out.println(orderSummary.toString());
				
				// 응답 전달
				request.setAttribute("memberId", memberId);
				request.setAttribute("orderSummary", orderSummary);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("product/orderresult.jsp");
				dispatcher.forward(request, response);	
			} else {
				request.setAttribute("message", "상품을 주문해 주십시오.");
				request.getRequestDispatcher("product/ordererror.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 페이지 입니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	protected boolean authorizationCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (request.getSession(false).getAttribute("grade").equals("A")) {
				return true;
			}
		} 
		return false;
	}
	
	/**
	 * 로그인 체크 : 회원 전용 서비스
	 */
	protected boolean authenticationCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && 
				session.getAttribute("memberId") != null) {
			return true;
		}
		return false;
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}

}
