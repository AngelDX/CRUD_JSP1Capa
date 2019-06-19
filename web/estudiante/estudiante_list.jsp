<%-- 
    Document   : lista
    Created on : 13-jul-2013, 23:15:18
    Author     : AngelDX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="angeldx.common.ConectarDB" %>
<% 
 ConectarDB cnn=new ConectarDB();
 String sql="SELECT * FROM estudiante";
 cnn.conectar();
 ResultSet rs=cnn.ejecutarConsulta(sql);
 %>
        <p><a href="javascript:fn_mostrar(0)" class="btn btn-primary">Registro Estudiante</a></p>
 <div class="navbar navbar-fixed-center">
    <div class="navbar-inner">      
         <div align="center" class="table table-bordered table-striped">              
            <table border="1" class="table">               
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombres y Apellidos</th>
                        <th>DNI</th>
                        <th>Tipo Colegio</th>
                        <th>Colegio</th>
                        <th>Categoria</th>
                        <th colspan="2">Opciones</th>
                    </tr>
                </thead>    
                    <tbody>
                   <% while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("apellidos")+", "+rs.getString("nombres")%></td>
                        <td><%=rs.getString("dni")%></td>
                        <td><%=rs.getString("tcolegio")%></td>
                        <td><%=rs.getString("ncolegio")%></td>
                        <td><%=rs.getString("categoria")%></td>
                        <td><a href="javascript:fn_mostrar(<%=rs.getString("id")%>)" class="menuitem"><img src="resources/img/figuras/editar.png"></a></td>
                        <td><a href="javascript:fn_eliminar(<%=rs.getString("id")%>)" class="menuitem"><img src="resources/img/figuras/eliminar.png"></a></td>
                    </tr>                    
                   <% }%>
                   </tbody>
                   <footer>
                       <tr><td colspan="8">Total registros:</td></tr>                       
                   </footer>
            </table>
           </div>
</div></div>                   
        <script type="text/javascript">
            function fn_mostrar(id){   
                $("#contenido").html('<img src="resources/img/spin.gif"/>Cargando...');
                //$("#contenido").load("registrar.htm",{id_est: id},success(data)); //no se puede usar porque va por post y el formcontroller lo detecta como submit
                $.post('estudiante/estudiante_add.jsp',{id_est: id},function(data) {
                    $('#contenido').html(data);                    
                });
            }
            function fn_eliminar(id){
                if(confirm("¿Desea eliminar el registro?")){
                $("#contenido").html('<img src="resources/img/spin.gif"/>Cargando...');
                //$("#contenido").load("registrar.htm",{id_est: id},success(data)); //no se puede usar porque va por post y el formcontroller lo detecta como submit
                $.post('estudiante/estudiante_man.jsp',{id_est:id, opt:"delete"},function(data) {
                    //if(data!="")alert(data);
                    $("#contenido").load("estudiante/estudiante_list.jsp");	
                });
                }else{
                    false;
                }
            }
        </script>