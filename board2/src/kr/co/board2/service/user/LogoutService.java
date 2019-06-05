package kr.co.board2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDao;
import kr.co.board2.vo.UserVO;

public class LogoutService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
	
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "redirect:/board2/user/login.do";
		//return "/user/login.jsp";	//get 요청일 경우 
	}

}
