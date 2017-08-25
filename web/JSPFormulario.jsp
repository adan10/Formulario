

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@page import="java.io.*, java.sql.*" %>
       <%
          String Nombre = request.getParameter("nombreA");
          String ApellidoPA=request.getParameter(("paterno"));
          String ApellidoMa=request.getParameter("materno");
          String Escuela=request.getParameter("escuela");
          
Connection con = null;
            Statement sta=null;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con= DriverManager.getConnection("jdbc:mysql://localhost/BD","root", "n0m3l0");
                sta = con.createStatement();
                
            }
            catch(SQLException error){
                out.println(error.toString());
            }
            try{
                sta.executeUpdate("insert into Datos values('"+Nombre+"','"+ApellidoPA+"','"+ApellidoMa+"','"+Escuela+"');");
                out.println("<script>alert ('Registro dado de alta exitosamente.')</script>");
                con.close();
                //out.println("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001;URL=http://localhost:8080/SALINAS_ROJASIntegradora_JSP/'/>");
            }
            catch(SQLException error){
                out.println(error.toString());
            }
            con.close();
       %>
    </body>
</html>
