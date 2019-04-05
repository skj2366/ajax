package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Address1Service;
import service.Impl.Address1ServiceImpl;
import utils.Command;

public class AddrServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Address1Service as =  new Address1ServiceImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = Command.getCmd(request);
		if("list".equals(cmd)) {
			as.selectAddrList(request);
			Command.goPage(request, response, "/views/addr1/list");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
