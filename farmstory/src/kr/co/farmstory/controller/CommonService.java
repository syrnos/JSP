package kr.co.farmstory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService {

	
	public abstract String requestProc(HttpServletRequest req, HttpServletResponse resp);
}
