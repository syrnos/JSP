package kr.co.board2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.UserDao;

public class UidCheckService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String uid = req.getParameter("uid");
		
		UserDao dao = UserDao.getInstance();
		
		int count = 0;
		
		try {
			count = dao.uidCheck(uid);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//JSON 생성 
		JSONObject json = new JSONObject();
		json.put("count", count);		//		json = {'count:1'}
		
		return json.toString();
	}

}
