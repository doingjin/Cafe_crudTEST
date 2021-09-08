<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.cafe.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="cdao" class="model.cafe.CafeDAO"/>
<jsp:useBean id="cvo" class="model.cafe.CafeVO"/>
<jsp:setProperty property="*" name="cvo"/>

<%
	String action=request.getParameter("action");
	
	if(action.equals("main")||action.equals("getone")){
		ArrayList<CafeVO> datas=cdao.getMenuList();
		request.setAttribute("datas", datas);
		if(action.equals("getone")){
			CafeVO data=cdao.getMenu(cvo);
			//int cnt=Integer.parseInt(request.getParameter("cnt"));
			System.out.print(request.getParameter("cnt"));
			//System.out.print(cnt);
			if(data.getCoff()==null||request.getParameter("cnt")==""){
				out.println("<script>alert('💥 You need to select What You Want ‼');history.go(-1);</script>");
			} else {
				System.out.print(Integer.parseInt(request.getParameter("cnt")));
				int total=data.getPrice()*(Integer.parseInt(request.getParameter("cnt")));
				System.out.print(total);
				request.setAttribute("data", data);
				request.setAttribute("total", total);
				pageContext.forward("cafe.jsp");
			}
		} else {
			pageContext.forward("cafe.jsp");
		}
	} 
	
	else if(action.equals("admin")){
		ArrayList<CafeVO> datas=cdao.getMenuList();
		request.setAttribute("datas", datas);
		pageContext.forward("admin.jsp");
	} else if(action.equals("newone")){
		if(cdao.newMenu(cvo)){
			ArrayList<CafeVO> datas=cdao.getMenuList();
			request.setAttribute("datas", datas);
			String alert1="Add Compelte!";
			request.setAttribute("alert1", alert1);
			pageContext.forward("admin.jsp");
		} else {
			out.println("<script>alert('💥 You need to enter ‼');history.go(-1);</script>");
		}
	} else if(action.equals("chgone")){
		if(cdao.chgMenu(cvo)){
			ArrayList<CafeVO> datas=cdao.getMenuList();
			request.setAttribute("datas", datas);
			String alert2="Change Compelte!";
			request.setAttribute("alert2", alert2);
			pageContext.forward("admin.jsp");
		}  else {
			out.println("<script>alert('💥 You need to enter ‼');history.go(-1);</script>");
		}
		
	} else if(action.equals("dltone")){
		if(cdao.dltMenu(cvo)){
			ArrayList<CafeVO> datas=cdao.getMenuList();
			request.setAttribute("datas", datas);
			String alert3="Delete Compelte!";
			request.setAttribute("alert3", alert3);
			pageContext.forward("admin.jsp");
		}  else {
			out.println("<script>alert('💥 You need to ENTER ‼');history.go(-1);</script>");
		}
	} else {
		out.println("Parameter Check!!!!!!! 🚨🚨🚨");
	}



%>