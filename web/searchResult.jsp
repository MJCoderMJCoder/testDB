<%@ page contentType="text/html;charset=gb2312" %> 
<% 
java.sql.Connection conn=null; 
java.lang.String strConn; 
java.sql.PreparedStatement preparedStmt=null; //������ 
java.sql.ResultSet sqlRst=null; //��������� 
try{
conn= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","6003"); 
preparedStmt =conn.prepareStatement("select idcustomer,firstname,lastname,address from customer where firstname like ? ");
//���ò���
String parm=new String( request.getParameter("parm").getBytes("iso-8859-1"));
out.print("��:"+parm);
preparedStmt.setString(1,"%"+parm+"%");
//ִ��Sql��� 
sqlRst=preparedStmt.executeQuery (); 
%>
<center>�˿���Ϣ��</center>
<table border="1" width="100%" bordercolorlight="#CC99FF" cellpadding="2" bordercolordark="#FFFFFF" cellspacing="0"> 
<tr> 
  <td align="center">&nbsp;ID</td> 
   <td align="center">��ַ</td> 
   <td align="center">����</td> 
  </tr> 
<% while (sqlRst.next()) { //ȡ����һ����¼
String name=new String(sqlRst.getString("firstname").getBytes("gbk"));
name+=new String(sqlRst.getString("lastname").getBytes("gbk"));
 %> 
<tr><!--��ʾ��¼--> 
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
//�رս��������
    if(sqlRst!=null)try{sqlRst.close(); } catch(java.sql.SQLException e1){
        out.println(e1.toString());
    }finally{
        try{
//�ر�������
            if(preparedStmt!=null)preparedStmt.close();
        }catch(java.sql.SQLException e2){
            out.println(e2.toString());
        }finally{
            try{
//�ر����ݿ�����
                if(conn!=null)conn.close();
            }catch(java.sql.SQLException e3){
                out.println(e3.toString());
            }
        }
    }
}
%>

