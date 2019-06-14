package kr.co.farmstory.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory.controller.CommonService;
import kr.co.farmstory.dao.BoardDao;
import kr.co.farmstory.vo.BoardVO;
import kr.co.farmstory.vo.UserVO;

public class WriteService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			
			String grp = req.getParameter("grp");
			String cate = req.getParameter("cate");
			
			req.setAttribute("grp", grp);
			req.setAttribute("cate", cate);
			
			
			return "/board/write.jsp";
			
		} else {
			
			String title = req.getParameter("subject");
			String content = req.getParameter("content");
			String grp = req.getParameter("grp");
			String cate = req.getParameter("cate");
			String regip = req.getRemoteAddr();
			
			HttpSession session = req.getSession();
			UserVO user = (UserVO) session.getAttribute("user");
			
			BoardVO vo = new BoardVO();
			vo.setCate(cate);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setFile(0);
			vo.setUid(user.getUid());
			vo.setRegip(regip);
			
			
			BoardDao dao = BoardDao.getInstance();
			
			
			try {
				dao.write(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "redirect:/farmstory/board/list.do?grp="+grp+"&cate="+cate;
		}
	}
}
