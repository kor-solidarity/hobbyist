package com.dh.hobbyist.artist.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dh.hobbyist.artist.model.service.ArtistService;
import com.dh.hobbyist.common.model.vo.Image;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/download.ar")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Image img = new ArtistService().selectOneImage(num);
		
		BufferedInputStream buf = null;
		
		ServletOutputStream downOut = response.getOutputStream();
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "static/upload/artist";
		
		String filePath = savePath + "/" + img.getImageName();

		File downFile = new File(filePath);

		response.setContentType("text/pain; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(img.getImageName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) downFile.length());
		
		FileInputStream fin = new FileInputStream(downFile);
		buf = new BufferedInputStream(fin);
		
		int readBytes = 0;
		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}
		
		downOut.close();
		buf.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
