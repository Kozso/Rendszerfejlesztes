import java.sql.*;  
  
public class AuthHelper {  
public static boolean validate(String name,String pass){  
boolean status=false;  
try{  
    Class.forName("com.mysql.jdbc.Driver");
//Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop_db", "root", "");
      
PreparedStatement ps=conn.prepareStatement(  
"select felh_nev, jelszo from felhasznalok where felh_nev=? and jelszo=?");  
ps.setString(1,name);  
ps.setString(2,pass);  
      
ResultSet rs=ps.executeQuery();  
status=rs.next();  
          
}catch(Exception e){System.out.println(e);}  
return status;  
}  
}  