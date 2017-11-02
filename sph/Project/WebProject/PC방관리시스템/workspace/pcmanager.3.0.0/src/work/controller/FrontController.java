package work.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import work.model.dao.MemberDao;
import work.model.dto.Member;
import work.util.Utility;

public class FrontController extends HttpServlet {
	/** Singleton Pattern : MemberDao */
	private MemberDao dao = MemberDao.getInstance();
		
	/**
	 * 회원관리시스템의 모든 요청을 dispatcher 처리하는 서비스 메서드
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		switch(action) {
			case "login":
				login(request, response);
				break;
			case "joinSave":
				joinSave(request, response);
				break;
			case "logout":
				logout(request, response);
				break;
			case "myInfo":
				myInfo(request, response);
				break;
			case "changePassword":
				changePassword(request, response);
				break;
			case "myInfoUpdate":
				myInfoUpdate(request, response);
				break;
			case "myInfoUpdateSave":
				myInfoUpdateSave(request, response);
				break;
			case "getMemberAll":
				getMemberAll(request, response);
				break;
			case "deleteMember":
				deleteMember(request, response);
				break;
			case "updateMember":
				updateMember(request, response);
				break;
			case "updateMemberSave":
				updateMemberSave(request, response);
				break;
			case "findMemberId":
				findMemberId(request, response);
				break;
			case "findMemberPw":
				findMemberPw(request, response);
				break;
			case "chatting":
				chatting(request, response);
				break;
			case "singleChatting":
				singleChatting(request, response);
				break;
			default:
				construction(request, response);
				break;
		}	
		
	}

	protected void construction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("member/construction.jsp");
	}
	
	/**
	 * 권한 체크 : 관리자 전용 서비스
	 */
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
	 * 비밀번호 찾기 : 아이디, 이름, 모바일
	 */
	protected void findMemberPw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> map = request.getParameterMap();
		if (map != null) {
			String memberId = map.get("memberId")[0];
			String memberName = map.get("memberName")[0];
			String mobile = map.get("mobile")[0];
			
			if (memberId != null && memberName != null &&
				mobile != null) {
				String tmpPw = dao.selectMemberPw(memberId, memberName, mobile);
				if (tmpPw != null) {
					StringBuilder info = new StringBuilder();
					info.append(memberId);
					info.append("님의 임시발급암호는 ");
					info.append(tmpPw);
					info.append(" 입니다.");
					info.append("로그인 후 암호를 변경하시기 바랍니다.");
					request.setAttribute("message", info);
					request.getRequestDispatcher("member/login.jsp").forward(request, response);
					return;
				}
			}
		}
		
		request.setAttribute("message", "정보를 다시 확인하시기 바랍니다.");
		request.getRequestDispatcher("/error.jsp").forward(request, response);
	}
	
	/**
	 * 아이디 찾기 : 이름, 연락처
	 */
	protected void findMemberId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberName = request.getParameter("memberName");
		String mobile = request.getParameter("mobile");
		
		if (memberName != null && mobile != null) {
			String memberId = dao.selectMemberId(memberName, mobile);
			if (memberId != null) {
				StringBuilder info = new StringBuilder();
				info.append(memberName);
				info.append("님의 아이디는 ");
				info.append(memberId);
				info.append(" 입니다.");
				request.setAttribute("message", info);
				request.getRequestDispatcher("member/login.jsp").forward(request, response);
				return;
			}
		}
		
		request.setAttribute("message", "정보를 다시 확인하시기 바랍니다.");
		request.getRequestDispatcher("/error.jsp").forward(request, response);
	}
	
	/**
	 * 관리자 :  회원 내정보 변경 저장 요청
	 */
	protected void updateMemberSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				String memberId = request.getParameter("memberId");
				String memberPw = request.getParameter("memberPw");
				String memberName = request.getParameter("memberName");
				String gender = request.getParameter("gender");
				String birthDate = request.getParameter("birthDate");
				String email = request.getParameter("email");
				String mobile = request.getParameter("mobile");
				String address = request.getParameter("adress");
				String entryDate = request.getParameter("entryDate");
				String grade = request.getParameter("grade");
				int mileage = Integer.parseInt(request.getParameter("mileage"));
				
				Member dto = new Member(memberId, memberPw, memberName, gender, birthDate, email, mobile, address, entryDate, grade, mileage);
				dao.updateAll(dto);	// 관리자 회원정보 변경 완료
				getMemberAll(request, response); // 응답: 전체회원조회
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
	
	/**
	 * 관리자 : 회원 정보 변경 (기본변경정보 + 가입일, 등급, 마일리지, 담당자)
	 */
	protected void updateMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				String memberId = request.getParameter("memberId");
				if (memberId != null && memberId.trim().length() > 0) {
					Member dto = dao.selectOne(memberId);  
					request.setAttribute("dto", dto);
					request.getRequestDispatcher("member/updateMember.jsp").forward(request, response);
				} 	
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
	
	/**
	 * 회원탈퇴 : 
	 * 관리자는 선택한 회원 탈퇴
	 * 일반/우수 회원은 로그인 회원 탈퇴 
	 */
	protected void deleteMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				String memberId = request.getParameter("memberId");
				if (memberId != null && memberId.trim().length() > 0) {
					dao.delete(memberId);  
					getMemberAll(request, response); 
				} 	
			} else {
				String memberId = request.getSession(false).getAttribute("memberId").toString(); 
				dao.delete(memberId);
				logout(request, response);
				//request.setAttribute("message", "회원님 탈퇴처리가 완료되었습니다.<br>그동안 이용해주셔서 감사합니다.");
				//request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}
	
	/**
	 * 관리자 : 전체회원조회
	 */
	protected void getMemberAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			if (authorizationCheck(request, response)) {
				ArrayList<Member> list = dao.selectList();
				request.setAttribute("list", list);
				request.getRequestDispatcher("member/memberList.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "해당 서비스에 대한 권한이 부족합니다.");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
	
	/**
	 * 로그인 회원 내정보 변경 저장 요청
	 */
	protected void myInfoUpdateSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			Member dto1 = (Member) request.getAttribute("dto");
			String memberId = request.getSession(false).getAttribute("memberId").toString();
			String memberPw = request.getParameter("memberPw");
			String memberName = request.getParameter("memberName");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			System.out.println(memberId + memberPw + memberName + email + mobile);
			Member dto = new Member(memberId, memberPw, memberName, email, mobile);
			dao.update(dto);
			request.setAttribute("message", "내정보 변경이 완료되었습니다.");
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
	
	/**
	 * 로그인 회원 내정보 변경위한 내정보 조회 요청
	 */
	protected void myInfoUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			String memberId = request.getSession(false).getAttribute("memberId").toString();
			Member dto = dao.selectOne(memberId);
			if (dto != null) {
				//String memberPw = dto.getMemberPw();
				//dto.setMemberPw(Utility.convertSecureString(memberPw,3));
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("member/myInfoUpdate.jsp").forward(request, response);
			} else {
				response.sendRedirect("result.jsp");
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}	
	
	/**
	 * 로그인 회원 암호 변경 요청
	 */
	protected void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			String memberId = request.getSession(false).getAttribute("memberId").toString();
			String memberPw = request.getParameter("memberPw");
			String newMemberPw = request.getParameter("newMemberPw");

			if (memberPw != null 
					&& newMemberPw != null
					&& memberPw.trim().length() > 0
					&& newMemberPw.trim().length() > 0) {
				int rows = dao.updatePassword(memberId, memberPw, newMemberPw);
				if (rows == 1) {
					request.setAttribute("message", "암호 변경이 완료되었습니다.");
					request.getRequestDispatcher("/result.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("message", "암호 변경이 정상적으로 이루어지 않았습니다. 다시 확인하시기 바랍니다.");
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "로그인/회원가입후 이용하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		
	}
	
	/** 로그아웃 메서드
	 */
	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			HttpSession session = request.getSession(false);
			session.removeAttribute("memberId");
			session.removeAttribute("grade");
			session.invalidate();
			response.sendRedirect("index.jsp");
		} else { 
			request.setAttribute("message", "로그인 후 사용하시기 바랍니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);		
		}
	}	
	
	/**
	 * 내정보 조회 메서드
	 */
	protected void myInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (authenticationCheck(request, response)) {
			String memberId = request.getSession(false).getAttribute("memberId").toString();
			Member dto = dao.selectOne(memberId);
			if (dto != null) {
				String memberPw = dto.getMemberPw();
				dto.setMemberPw(Utility.convertSecureString(memberPw,3));
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("member/myInfo.jsp").forward(request, response);
			} else {
				response.sendRedirect("result.jsp");
			}
		} else {
			request.setAttribute("message", "회원전용 서비스 입니다. 로그인 후 사용하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}	
		
	/**
	 * 회원가입 저장요청
	 */
	protected void joinSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String gender = request.getParameter("gender");
		String birthDate = request.getParameter("birthDate");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		
		// service 클래스에서 추가 설정 로직 진행
		String entryDate = Utility.getCurrentDay();
		String grade = "G";
		int mileage = 0;
		
		Member dto = new Member(memberId, memberPw, memberName, gender, birthDate, email, mobile, address, entryDate, grade, mileage);
		int rows = dao.insert(dto);
		if (rows == 1) {
			request.setAttribute("message", memberName + "님 회원가입이 완료되었습니다.<br>로그인 후 이용하시기 바랍니다.");
			request.getRequestDispatcher("member/login.jsp").forward(request, response);
		} else {
			request.setAttribute("message", memberName + "님 회원가입이 정상적으로 이루어 지지 않았습니다.<br>다시 확인 하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	/**
	 * 로그인요청 메서드
	 */
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		if (memberId.length() > 0 && memberPw.length() > 0) {
			String grade = dao.loginCheck(memberId, memberPw);
			if (grade != null) {
				HttpSession session = request.getSession(true); 
				session.setAttribute("grade", grade);
				session.setAttribute("memberId", memberId);
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "로그인 정보가 올바르지 않습니다. 다시 확인하시기 바랍니다.");
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}	
		} else {
			request.setAttribute("message", "로그인 정보를 입력하시기 바랍니다.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}	
	}
	
	protected void chatting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## action : chating()");
		HttpSession session = request.getSession(false); //
		String memberId = (String)session.getAttribute("memberId");
		session.setAttribute("memberId", memberId);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/chatting.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void singleChatting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## action : singleChatting()");
		HttpSession session = request.getSession(false); //
		String memberId = (String)session.getAttribute("memberId");
		String grade = (String)session.getAttribute("grade");
		session.setAttribute("memberId", memberId);
		session.setAttribute("grade", grade);
		System.out.println("등급 : " + grade);
		if (grade.equals("G")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/chatting/singleChattingG.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/chatting/singleChattingA.jsp");
			dispatcher.forward(request, response);
		}
		
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
