<%@page contentType="text/html;charset=gb2312"%>
<%
    java.sql.Connection conn = null;
    java.lang.String strConn;
    try{
        conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "6003");
  %>
  ����MySQL���ݿ�ɹ���
  <%
  } catch(java.sql.SQLException e) {
      out.println(e.toString());
  } finally{
        if(conn!=null) conn.close();
    }
%>