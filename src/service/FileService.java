package service;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public interface FileService {

	public Map<String,String> parseText(HttpServletRequest request) throws ServletException;
	
}
