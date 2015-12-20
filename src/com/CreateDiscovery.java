package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;

import javax.servlet.http.Part;

import dao.LoginDao;
import bean.*;


/**
 * Servlet implementation class CreateDiscovery
 */
@MultipartConfig
public class CreateDiscovery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateDiscovery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entering into of CreateDiscovery discovery.......");
		System.out.println("Entering into of CreateDiscovery discovery.......");
		
		HttpSession session = request.getSession();
		
		String writer_name = (String)session.getAttribute("name");
		
		
		
		InputStream inputStream = null;
		
		
		String message = request.getParameter("message");
		String category_name = request.getParameter("categoryName");
		String articleName = request.getParameter("articleName");
		
		
		final Part filePart = request.getPart("photo");
        final String fileName = getFileName(filePart);
		if(filePart==null)
		{
			System.out.println("File part is nul null nulll null ");
		}
		inputStream = filePart.getInputStream();
		
		DiscoveryBean oDiscoveryBean = new DiscoveryBean();
		oDiscoveryBean.setArtical_name(articleName);
		oDiscoveryBean.setCategory(category_name);
		oDiscoveryBean.setMessage(message);
		oDiscoveryBean.setImg_name(inputStream);
		LoginDao oLoginDao = new LoginDao();
		
		
		
		System.out.println("message : "+message);
		System.out.println("category_name : "+category_name);
		System.out.println("articleName : "+articleName);
		
		
		
		
		String statu= oLoginDao.insertDiscovery(oDiscoveryBean,writer_name);
		
		System.out.println("Execution Satus is as : "+statu);
		request.setAttribute("discoveryInsert", statu);
		RequestDispatcher req = request.getRequestDispatcher("Create.jsp");
		req.forward(request, response);
		
		
		
	}
	
	
	private String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
