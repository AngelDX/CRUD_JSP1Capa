/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package angeldx.common;
import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author AngelDX
 */
public class ConectarDB {
  public Connection cn=null;
  public Statement st=null;
  public ResultSet rs=null;  
  
  public Connection conectar() throws Exception{
    try{
      String servidor="localhost";
      String puerto="3306";
      String usuario="root";
      String password="root";
      String basedatos="dbconcurso";
      String driver="com.mysql.jdbc.Driver";
      String cadenaconexion="jdbc:mysql://"+servidor+":"+puerto+"/"+basedatos;
     
      Class.forName(driver);
      cn=DriverManager.getConnection(cadenaconexion,usuario,password);    
    }catch(Exception e){
        JOptionPane.showMessageDialog(null,"Error de conexion a la Base de Datos");
    }finally{ 
      return cn;
    }
  }
  
  public ResultSet ejecutarConsulta(String sql) throws Exception{
      st=cn.createStatement();
      rs=st.executeQuery(sql);
      return rs;
  }
  
  public boolean ejecutarActualizacion(String sql) throws Exception{
      st=cn.createStatement();
      int rs=st.executeUpdate(sql);
      if(rs==1){
          return true;   
      }else{
          return false;   
      }
  }
  
  public void desconectar() throws Exception{
      cn.close();
  }
 
}
