<%-- 
    Document   : registro
    Created on : 14-jul-2013, 20:21:49
    Author     : AngelDX
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="angeldx.common.ConectarDB" %>
<% 
    int id=Integer.parseInt(request.getParameter("id_est"));
    String opt="";
    ResultSet rs=null;
    if(id!=0){
        opt="Actualizar";
        out.print("<h2>Editar Estudiante</h2>");
        ConectarDB cnn=new ConectarDB();
        cnn.conectar();
        String sql="SELECT * FROM estudiante WHERE id="+id;
        rs =cnn.ejecutarConsulta(sql); 
        rs.next();
    }else{
        opt="Registrar";
        out.print("<h2>Registrar Estudiante</h2>");
        
    }
%>
 
 <div class="navbar navbar-fixed-center">
    <div class="navbar-inner">
       <form method="POST" action="estudiante/estudiante_man.jsp" id="formulario"> 
        <input type="hidden" name="opt" value="<%=opt%>"/>
        <input type="hidden" name="id" value="<%=id%>"/>
        
        <div class="control-group">
            <label class="control-label" for="inputEmail">Nombres* :</label>
            <div class="controls">
                <input class="form-control input-lg" type="text" name="txtnombre" value="<%=(rs!=null)?rs.getString("nombres"):""%>" placeholder="Nombre"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">Apellidos* : </label>
            <div class="controls">
                <input type="text" name="txtapellidos" value="<%=(rs!=null)?rs.getString("apellidos"):""%>" placeholder="Apellidos"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">DNI* : </label>
            <div class="controls">
                <input type="text" name="txtdni" value="<%=(rs!=null)?rs.getString("dni"):""%>" placeholder="DNI"/>
            </div>
        </div>
         <div class="control-group">
            <label class="control-label">Tipo de colegio *: </label>
            <div class="controls">
                <input type="radio" name="tcolegio" value="PARTICULAR" <%=(rs!=null&&rs.getString("tcolegio").equals("PARTICULAR"))?"checked":""%>/> Particular 
                <input type="radio" name="tcolegio" value="ESTATAL" <%=(rs!=null&&rs.getString("tcolegio").equals("ESTATAL"))?"checked":""%>/> Estatal        
            </div>
        </div>
      <div class="control-group">
            <label class="control-label">Nombre de colegio* :</label>
            <div class="controls">
                <input type="text" name="txtncolegio" value="<%=(rs!=null)?rs.getString("ncolegio"):""%>" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">Categoria* :</label>
            <div class="controls">
                <select name="categoria">
                    <option <%=(rs!=null&&rs.getString("categoria").equals("A")?"selected":"")%>>A</option>
                    <option <%=(rs!=null&&rs.getString("categoria").equals("B")?"selected":"")%>>B</option>
                    <option <%=(rs!=null&&rs.getString("categoria").equals("C")?"selected":"")%>>C</option>
                    <option <%=(rs!=null&&rs.getString("categoria").equals("D")?"selected":"")%>>D</option>
                </select>
            </div>
        </div>  
      <div class="control-group">
        <div class="controls">
          <button type="submit" class="btn btn-primary"><%=opt%></button>
        </div>
      </div>
     </form>            
</div>
     <div id="msg"></div>
</div>
 
<script type="text/javascript">
$(document).ready(function(){
 $('#formulario').validate({
  errorElement: "span",
  rules: {
      txtnombre: {
          minlength: 3,
          required: true
      },
      txtapellidos: {
          minlength: 3,
          required: true  //email: true Para emails
      },
      txtdni: {
         minlength: 2,
          digits: true
      },
      txtcolegio: {
          minlength: 2,
          required: true
      }
  },
  messages: {
       txtnombre: {
       required: "Es necesario registrar el nombre de estudiante",
       minlength: jQuery.format("Son necesariost {0} caracteres!")
       }
  },
  highlight: function(element) {
   $(element).closest('.control-group')
   .removeClass('success').addClass('error');
  },
  success: function(element) {
   element
   .text('OK!').addClass('help-inline')
   .closest('.control-group')
   .removeClass('error').addClass('success');
  },
  submitHandler: function() { 
    msg=confirm('\xBFDesea realmente registrar el estudiante?');
    if(msg){        
	$.ajax({
            type: 'POST',
            url: $("#formulario").attr('action'),
            data: $("#formulario").serialize(),
            //beforeSend: loading,					
            success: function(data) {                                  
                $("#msg").html(data);
            }
        });
	return false;					
	}      
  }
 });
});
</script>