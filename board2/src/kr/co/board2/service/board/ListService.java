package kr.co.board2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.board2.controller.CommonService;
import kr.co.board2.dao.BoardDao;
import kr.co.board2.vo.BoardVO;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String pg = req.getParameter("pg");
		
		BoardDao dao = BoardDao.getInstance();
		
		try {
			
			int start = getLimitStrat(pg);
			
			//전체 게시물 갯수 구하기
			int total = dao.getTotalCount();
			int page = getPage(total);
			
			//리스트 카운트 번호
			int count = getListCount(total,start);
			
			//페이지 그룹 시작, 끝 구하기
			int[] groupStartEnd = getPageGroupStartEnd(pg, total); 
			
			List<BoardVO> list = dao.selectList(start);
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			req.setAttribute("count", count);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "/list.jsp";
	}
	
	//Limit start 계산 
	private int getLimitStrat(String pg) {
		
		int start = 0;
		
		if(pg == null) {
			start = 1;
		} else {
			start = Integer.parseInt(pg);
		}
		
		return (start - 1) * 10;
	}
	
	//page 번호 계산
	private int getPage(int total) {
		int page = 0;
		
		if(total % 10 == 0) {
			page = total / 10;
		} else {
			page = (total / 10) + 1;
		}
		
		return page;
	}
	
	private int getListCount(int total,int start) {
		
		return total - start;
	}
	
	public int getCurrentPage(String pg) {
		int current = 0;
		if(pg ==  null) {
			current = 1;
		}else {
			current = Integer.parseInt(pg);
		}
		return current;
	}
	
	private int[] getPageGroupStartEnd(String pg, int totalPage) {
		
		int[] startEnd = new int[2];
		
		int current = getCurrentPage(pg);							//현재 페이지
		int currentGroup = (int) Math.ceil(current/10.0);				//페이지 그룹  페이지수/10 해서 나머지를 올림 Math.ceil(올림)
		int groupStart = (currentGroup - 1) * 10 +1 ;
		int groupEnd = currentGroup * 10;
		
		if(groupEnd > totalPage){
			groupEnd = totalPage;
		}
		
		startEnd[0] = groupStart;
		startEnd[1] = groupEnd;
		
		return startEnd;
	}
	
}
