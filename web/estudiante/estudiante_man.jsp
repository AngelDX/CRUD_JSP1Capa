<%-- 
    Document   : estudiante_man
    Created on : 23/10/2013, 10:05:06 PM
    Author     : AngelDX
--%>

<%@page import="java.sql.*" %>
<%@page import="angeldx.common.ConectarDB" %>
<% 
 ConectarDB cnn=new ConectarDB();
 cnn.conectar();
 String opt=request.getParameter("opt");
 
if(opt.equals("Registrar")){
    String nom=request.getParameter("txtnombre");
    String ape=request.getParameter("txtapellidos");
    String dni=request.getParameter("txtdni");
    String tcol=request.getParameter("tcolegio");
    String ncol=request.getParameter("txtncolegio");
    String cat=request.getParameter("categoria");

    String sql="INSERT INTO estudiante (nombres,apellidos,dni,tcolegio,ncolegio,categoria) "
            + "VALUES('"+nom+"','"+ape+"','"+dni+"','"+tcol+"','"+ncol+"','"+cat+"')";
    //out.println(sql);
    if(cnn.ejecutarActualizacion(sql)){
        out.println("Estudiante registrado");
    }else{
        out.println("Error al procesar datos");
    }
}


if(opt.equals("Actualizar")){
    String id=request.getParameter("id");
    String nom=request.getParameter("txtnombre");
    String ape=request.getParameter("txtapellidos");
    String dni=request.getParameter("txtdni");
    String tcol=request.getParameter("tcolegio");
    String ncol=request.getParameter("txtncolegio");
    String cat=request.getParameter("categoria");

    String sql="UPDATE estudiante SET nombres='"+nom+"',apellidos='"+ape+"',dni='"+dni+"',tcolegio='"+tcol+"',ncolegio='"+ncol+"',categoria='"+cat+"' WHERE id="+id;
    //out.println(sql);
    if(cnn.ejecutarActualizacion(sql)){
        out.println("Datos de Estudiante Actulizado");
    }else{
        out.println("Error al procesar datos");
    } 
}

if(opt.equals("delete")){
    String id=request.getParameter("id_est");
           
    String sql="DELETE FROM estudiante WHERE id="+id;
    cnn.ejecutarActualizacion(sql);    
}
%>