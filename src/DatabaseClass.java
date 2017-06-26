/**
 * Created by MAYOWA on 25-Jun-17.
 */
import com.sun.java.browser.plugin2.liveconnect.v1.Result;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
//Class.forName("com.mysql.jdbc.Driver");

public class DatabaseClass {
//    craeting the neccesary database class objects
    Connection con;
    Statement st;
//    ResultSet rs;

    //default constructor
    public DatabaseClass(){
        try{
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/sarperstein_db" , "root", "");
            Statement st = (Statement) con.createStatement();
        }
        catch(Exception ex){
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
//method for insert statement
    public boolean insert(String sql){
        boolean check;
        try{
            st.executeUpdate(sql);
            con.setAutoCommit(true);
            check = true;
            con.close();
        }
        catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
            check =false;
        }
        catch(Exception ex){
            ex.printStackTrace();
            check = false;
        }
        return check;
    }

//    method for select statement
    public ResultSet select(String sql){
        ResultSet rs = null;
        try{
//            st = (PreparedStatement) con.prepareStatement(sql);
            rs = st.executeQuery(sql);
        }
        catch (SQLException ex) {
            Logger.getLogger(DatabaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return rs;
    }
}
