package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.UploadFIle;



public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public FileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,Object> paramMap = UploadFIle.parseRequest(request);
		System.out.println(paramMap);
		doGet(request, response);
	}

}
