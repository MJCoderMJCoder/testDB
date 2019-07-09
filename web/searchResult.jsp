<%@ page contentType="text/html;charset=gb2312" %> 
<% 
java.sql.Connection conn=null; 
java.lang.String strConn; 
java.sql.PreparedStatement preparedStmt=null; //语句对象 
java.sql.ResultSet sqlRst=null; //结果集对象 
try{
conn= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","6003"); 
preparedStmt =conn.prepareStatement("select idcustomer,firstname,lastname,address from customer where firstname like ? ");
//设置参数
String parm=new String( request.getParameter("parm").getBytes("iso-8859-1"));
out.print("姓:"+parm);
preparedStmt.setString(1,"%"+parm+"%");
//执行Sql语句 
sqlRst=preparedStmt.executeQuery (); 
%>
<center>顾客信息表</center>
<table border="1" width="100%" bordercolorlight="#CC99FF" cellpadding="2" bordercolordark="#FFFFFF" cellspacing="0"> 
<tr> 
  <td align="center">&nbsp;ID</td> 
   <td align="center">地址</td> 
   <td align="center">姓名</td> 
  </tr> 
<% while (sqlRst.next()) { //取得下一条记录
String name=new String(sqlRst.getString("firstname").getBytes("gbk"));
name+=new String(sqlRst.getString("lastname").getBytes("gbk"));
 %> 
<tr><!--显示记录--> 
  <td><%=sqlRst.getString("idcustomer")%></td> 
  <td><%=new String(sqlRst.getString("address").getBytes("gbk"))%></td> 
  <td><%=name%></td> 
   </tr> 
<% } %> 
</table> 
<%
 } catch (java.sql.SQLException e){
    out.println(e.toString());
}finally{
//关闭结果集对象
    if(sqlRst!=null)try{sqlRst.close(); } catch(java.sql.SQLException e1){
        out.println(e1.toString());
    }finally{
        try{
//关闭语句对象
            if(preparedStmt!=null)preparedStmt.close();
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

