package goal.controller;

import goal.dao.MongoCon;
import goal.service.ServiceR;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CompanyController
 */
@WebServlet(name = "companycontroller", urlPatterns = { "/companycontroller" })
public class CompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//	HttpServletRequest request;
//	HttpServletResponse response;
	MongoCon con = new MongoCon("goalin","spec");
//	HttpSession session = request.getSession(true);

	public CompanyController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action =request.getParameter("action");
		System.out.println(action);
		
		switch(action){
			case "company_search":
				company_search(request, response);
				break;
			case "spec_search":
				spec_search(request, response);
				break;
			default:
		}
	}
	
	protected void company_search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		HttpSession session = request.getSession(false);
		
		// 회사 리스트에 있는 기업인지 확인 하는 함수 필요
		String company_name = request.getParameter("company_name_input");
		if (company_name.length() > 0) {
			request.setAttribute("company_name_output",company_name);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/CompanyAnal.jsp");
			dispatcher.forward(request,response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/CompanyAnal.jsp");
			dispatcher.forward(request,response);
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void spec_search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// univ_name, major, grade, toeic, opic, toss, certification, volunteer, foreign
//		HttpSession session = request.getSession(false);
		String univ_name = request.getParameter("univ_name");
		String major = request.getParameter("major");
		double grade = Double.parseDouble(request.getParameter("grade"));
		int toeic = Integer.parseInt(request.getParameter("toeic"));
		String opic = request.getParameter("opic");
		int tos = Integer.parseInt(request.getParameter("tos"));
		int license = Integer.parseInt(request.getParameter("license"));
		int vol = Integer.parseInt(request.getParameter("vol"));
		int abr_train = Integer.parseInt(request.getParameter("abr_train"));
		int intern = Integer.parseInt(request.getParameter("intern"));
	
		if (univ_name.length() > 0 && major.length() > 0 && opic.length()>0) {
			
			request.setAttribute("univ_name",univ_name);
			request.setAttribute("major",major);
			request.setAttribute("grade",grade);
			request.setAttribute("toeic",toeic);
			request.setAttribute("opic",opic);
			request.setAttribute("tos",tos);
			request.setAttribute("license",license);
			request.setAttribute("vol",vol);
			request.setAttribute("abr_train",abr_train);
			request.setAttribute("intern",intern);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SpecResult.jsp");
			dispatcher.forward(request,response);
			
		} else {			// 모든 항목 입력 안했을 경우
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Spec.jsp");
			dispatcher.forward(request,response);
		}
		
	
	}
	protected void doget(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		process(request,response);
	}

}
