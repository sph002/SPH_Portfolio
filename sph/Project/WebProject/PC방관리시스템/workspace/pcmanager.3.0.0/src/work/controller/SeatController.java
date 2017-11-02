package work.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work.model.dao.MemberDao;
import work.model.dao.SeatDao;
import work.model.dto.Member;
import work.model.dto.Seat;
import work.model.dto.UseList;

/**
 * Servlet implementation class SeatController
 */
public class SeatController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest request;
	HttpServletResponse response;
	private SeatDao dao = new SeatDao();       

    public SeatController() {
        super();
    }
    protected void proccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청파악 action =0000
    	//요청데이터 추루
    	//요청 데이털 검증
    	//모델에게 요청처리 의뢰
    	//모델에게 요청결과받아서 응답위한 결과값 설정
    	//응답페이지로이동 
    	String action = request.getParameter("action");
    	//Form tag에서 엑션을 확인해야함
    	System.out.println("action = " +action);

    	switch(action){
    		case "checkCondition":
    		checkCondition(request,response);
        	break;
    		case "payCharge":
    		payCharge(request,response);
            break;
    	}
	}
  
    protected void checkCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				ArrayList<Seat> list = dao.selectList();
				request.setAttribute("list", list);
				request.getRequestDispatcher("seat/seatList.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
    }


    
    protected void payCharge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int seatNo =0;
    	seatNo = Integer.parseInt(request.getParameter("seatNo").trim());
    	String memberId = request.getParameter("memberId").trim();
    	int totalCount = Integer.parseInt(request.getParameter("totalCost"));
    	int useTime=0;
    	switch(totalCount){
    		case 1000:
    		useTime=60;
    		break;
    		
    		case 2000:
        	useTime=120;
        	break;
        	
    		case 3000:
        	useTime=180;
        	break;
        	
    		case 5000:
        	useTime=360;
        	break;
        	
    		case 8000:
            useTime=600;
            break;
    		
    		case 10000:
            useTime=720;
            break;	
    	} 
    	
    	SeatDao sDao = new SeatDao();
    	MemberDao mDao = MemberDao.getInstance();
    	
    	int condition = dao.selectOne(seatNo).getCondition();
    	Member member = mDao.selectOne(memberId);
    	
    	if(member!=null){
    		if(condition==0 && seatNo!=0){
    			if(useTime!=0){
    				UseList useList = new UseList(memberId,seatNo,useTime,totalCount);
    	        	sDao.insertUseList(useList);
    	        	sDao.Update(seatNo, memberId, useTime);
    	        	mDao.updateMileage(memberId,useTime);
    	    		request.getRequestDispatcher("seat/result.jsp").forward(request, response);
    			} else {
    				request.setAttribute("message", "결제정보가 올바르지않습니다");
    				request.getRequestDispatcher("/error.jsp").forward(request, response);
    			}
    		} else {
    			request.setAttribute("message", "이용할수없는 좌석입니다");
    			request.getRequestDispatcher("/error.jsp").forward(request, response);
    		}
    		
    	}else {
			request.setAttribute("message", "존재하는 아이디가없습니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
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
	
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	proccess(request,response);
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proccess(request,response);
	}

}
