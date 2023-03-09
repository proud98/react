<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%

	//이미지가 업로드 되는 실제 경로 구하기
	String realPath=getServletContext().getRealPath("/shopsave");
	//getServletContext()안에 getRealPath가 있고 저장 하는 가상 폴더 이름은 save
	System.out.println(realPath);
	
	int uploadSize=1024*1024*2; //2mb
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
	
	//multi변수로 모든 폼데이터 읽어오기
	String category=multi.getParameter("category");
	String sangpum=multi.getParameter("sangpum");
	int price=Integer.parseInt(multi.getParameter("price"));
	String ipgoday=multi.getParameter("ipgoday");
	String photo=multi.getFilesystemName("photo");
	
	//dto에 저장
	ShopDto dto=new ShopDto();
	dto.setCategory(category);
	dto.setSangpum(sangpum);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	dto.setPhoto(photo);
	
	//dao선언
	ShopDao dao=new ShopDao();
	dao.insertShop(dto);
	
	//방명록 목록으로 이동
	response.sendRedirect("../index.jsp?main=shop/addform.jsp");
	
	}catch(Exception e){
		System.out.println("업로드 오류"+e.getMessage());
	}
	%>