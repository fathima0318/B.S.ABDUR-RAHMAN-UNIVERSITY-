package com;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DiscoveryBean;
import dao.DiscoveryDao;

/**
 * Servlet implementation class ViewLargeImage
 */
public class ViewLargeImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewLargeImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		OutputStream os = response.getOutputStream();
		System.out.println("=============================================");
		System.out.println("=============================================");
		response.setContentType("image/jpg");
		
		String id = (String)request.getAttribute("id");
		System.out.println("ID is as ================================: "+id);
		DiscoveryDao oDiscoveryDao = new DiscoveryDao();
		DiscoveryBean oDiscoveryBean = oDiscoveryDao.getDiscoveryDetails(id);
		InputStream inpusteam;
		System.out.println("oDiscoveryBean..."+oDiscoveryBean);
		if(oDiscoveryBean!=null)
		{
			inpusteam = oDiscoveryBean.getImg_name();
			System.out.println("inpusteam"+inpusteam);
			if(inpusteam!=null)
			{
				
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024];
				while (true)
				{
				    int r = inpusteam.read(buffer);
				    System.out.println("r is..."+r);
				    if (r == -1)
				    {
				    	break;
				    }
				    out.write(buffer, 0, r);
				}

				byte[] ret = out.toByteArray();
				os.write(ret);
				System.out.println("333");
				
				
			}
			else
			{
				System.out.println("Input steam is nPrintWriter out =	response.getWriter(); null ");
			}
			
		}
		else
		{
			System.out.println("DiscoveryBean is  null null null ");
		}
		
		System.out.println("In side of do get of DisplayDiscovery");
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
