<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<%@ page import="com.example.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		BoardVO u = new BoardVO();
		u.setSeq(id);
		BoardDAO boardDAO = new BoardDAO();
		//업로드한 photo 파일 삭제
		String filename = u.getFileName();
		if(filename != null)
			FileUpload.deleteFile(request, filename);

		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>