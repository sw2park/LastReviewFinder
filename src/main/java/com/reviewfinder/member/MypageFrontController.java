package com.reviewfinder.member;

import java.io.IOException;

import com.reviewfinder.action.ActionForward;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.mp")
public class MypageFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	
		String requestURI = request.getRequestURI();
		ActionForward forward = null;
	
		switch(requestURI) {
		
		case "/mypage/UpdatePassword.mp":
			//비밀번호 변경
			forward = new UpdatePasswordAction().execute(request, response);
			break;	
		
		case "/mypage/UpdateName.mp":
			//닉네임 변경
			forward = new UpdateNameAction().execute(request, response);
			break;	
			
		case "/mypage/UpdateProfile.mp":
			//프로필사진 변경
			forward = new UpdateProfileAction().execute(request, response);
			break;	
			
		case "/mypage/ReturnProfile.mp":
			//프로필사진 변경
			forward = new ReturnProfileAction().execute(request, response);
			break;	
			
		case "/mypage/DeleteMember.mp":
			//회원 탈퇴
			forward = new DeleteMemberAction().execute(request, response);
			break;	
	
		case "/mypage/ShowMyContents.mp":
			//'보관함' 전체 조회
			forward = new ShowMyContentsDetailAction().execute(request, response);
			break;	
		
		case "/mypage/ShowMyContentsMain.mp":
			//'보관함' 마이페이지 메인 조회
			forward = new ShowMyContentsMainAction().execute(request, response);
			break;	
	}




		if(forward != null) {
	         if(forward.isRedirect()) {
	        	 response.sendRedirect(forward.getPath());
	         }else {
	            RequestDispatcher disp = request.getRequestDispatcher(forward.getPath());
	            disp.forward(request, response);
	         }
	      }
		
	
	}
	
}

