package kr.co.farmstory.service.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory.controller.CommonService;
import kr.co.farmstory.dao.BoardDao;
import kr.co.farmstory.vo.BoardVO;

public class IndexService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		BoardDao dao = BoardDao.getInstance();
		
		try {
			List<BoardVO> list1 = dao.latest("grow");
			List<BoardVO> list2 = dao.latest("school");
			List<BoardVO> list3 = dao.latest("story");

			req.setAttribute("list1", list1);
			req.setAttribute("list2", list2);
			req.setAttribute("list3", list3);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/index.jsp";
	}
}
