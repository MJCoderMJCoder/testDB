

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
java.sql.Connection conn=null; 
java.lang.String strConn; 
java.sql.Statement sqlStmt=null; //语句对象 
java.sql.ResultSet sqlRst=null; //结果集对象 
try{
    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","6003"); 
    sqlStmt=conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY);
//执行Sql语句 
    String sqlQuery="select idcustomer,address,phone from customer"; 
    sqlRst=sqlStmt.executeQuery (sqlQuery); 
%>
<center>顾客信息表</center>
<table border="1" width="100%" bordercolorlight="#CC99FF" cellpadding="2" bordercolordark="#FFFFFF" cellspacing="0"> 
<tr> 
  <td align="center">ID</td> 
  <td align="center">地址</td> 
  <td align="center">电话</td> 
</tr> 
<% while (sqlRst.next()) { //取得下一条记录 %> 
<tr><!--显示记录--> 
  <td><%=sqlRst.getString("idcustomer")%></td> 
  <td><%=new String(sqlRst.getString("address"))%></td> 
  <td><%=sqlRst.getString("phone")%></td>
 </tr> 
<% } %> 
</table> 
<%
 } catch (java.sql.SQLException e){
out.println(e.toString());
}finally{
    //关闭结果集对象 
  if(sqlRst!=null)try{sqlRst.close();}catch(java.sql.SQLException e1){
      out.println(e1.toString());
  } finally{
      try{
         //关闭语句对象 
          if(sqlStmt!=null)sqlStmt.close ();  
      }catch(java.sql.SQLException e2){
          out.println(e2.toString());
      }finally{
          try{
//关闭数据库连接 
              if(conn!=null)conn.close(); 
          }catch(java.sql.SQLException e3){
              out.println(e3.toString());
          }
      }
  }
  
}
%> 
