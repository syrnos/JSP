package kr.co.farmstory.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory.controller.CommonService;
import kr.co.farmstory.dao.UserDao;
import kr.co.farmstory.vo.UserVO;

public class LoginService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			
			return "/user/login.jsp";
			
		} else {
			String uid = req.getParameter("id");
			String pass = req.getParameter("pw");
			
			UserDao dao = UserDao.getInstance();
			
			HttpSession session = req.getSession();
			
			UserVO vo = null;
			try {
				vo = dao.login(uid, pass);
				//회원이 아니면 null
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(vo == null) {
				return "redirect:/farmstory/user/login.do?result=fail";
			} else {
				session.setAttribute("user", vo);
				return "redirect:/farmstory/index.do";
			}
		}
	}
}
