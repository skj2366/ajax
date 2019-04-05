package service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface Address1Service {
	public List<Map<String,String>> selectAddrList(HttpServletRequest request);
	public int selectTotalAddrCount();
}
