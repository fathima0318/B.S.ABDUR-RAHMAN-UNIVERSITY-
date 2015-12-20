package com;

import java.io.IOException;
import java.lang.Character.Subset;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DiscoveryDao;
import java.util.ArrayList;
import bean.DiscoveryBean;

/**
 * Servlet implementation class ViewDiscovery
 */
public class ViewDiscovery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewDiscovery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("name");
		System.out.println("######VIEW########");
		System.out.println("LOGIN USER NAME IS AS : "+username.trim());
		DiscoveryDao  oDiscoveryDao = new DiscoveryDao();
		String listofId = oDiscoveryDao.getID(username.trim());
		
		System.out.println("User Details  : "+listofId);
		try
		{
			String newListID = listofId.substring(0, listofId.lastIndexOf(","));
			ArrayList alldiscoveryDetails =oDiscoveryDao.getDiscoveryAllDetails(newListID);
			System.out.println("List of ID's "+newListID);
			request.setAttribute("AllIDS", newListID);
			request.setAttribute("AllDiscoveryDetails", alldiscoveryDetails);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("exception for arraylist");
			request.setAttribute("errormsg", "No Record Found...!!!");
			RequestDispatcher req= request.getRequestDispatcher("Error.jsp");
		    
			req.include(request, response);		
			
		}
		RequestDispatcher req= request.getRequestDispatcher("ViewDiscovery.jsp");
		req.forward(request, response);		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
