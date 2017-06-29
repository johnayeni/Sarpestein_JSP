package db;
import java.sql.*;

/**
 * Created by MAYOWA on 28-Jun-17.
 */
public class DBHelper {
    private void ExecuteInsert(String query)
    {
        try
        {
            Connection con = ((Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db", "root", ""));
            Statement st = (Statement) con.createStatement();

            if(query.toLowerCase().contains("insert"))
            {
                st.executeUpdate(query);
            }

            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

    public static int CountItems(ResultSet resultSet)
    {
//        int count = 0;
//        try
//        {
//            while(resultSet.next())
//            {
//                count++;
//            }
//        }
//        catch (Exception ex)
//        {
//            ex.printStackTrace();
//        }
//        System.out.println(count);
//        return count;

        if (resultSet == null) {
            return 0;
        }
        try {
            resultSet.last();
            return resultSet.getRow();
        } catch (SQLException exp) {
            exp.printStackTrace();
        } finally {
            try {
                resultSet.beforeFirst();
            } catch (SQLException exp) {
                exp.printStackTrace();
            }
        }
        return 0;
    }


    public ResultSet ExecuteQuery(String query)
    {
        try
        {
            Connection con = ((Connection) DriverManager.getConnection("jdbc:mysql://localhost/device_store_db", "root", ""));
            Statement st = (Statement) con.createStatement();

            if(query.toLowerCase().contains("select"))
            {
                ResultSet set = st.executeQuery(query);

                if( !(set.equals(null)))
                {
                    return set;
                }
            }
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }

        return null;
    }

    private int CheckIfExist(String value, String tableName, String paramName)
    {
        //check if exist
        String query = String.format("SELECT * FROM {0} WHERE {1} = {2}", tableName, paramName, value);
        ResultSet set = this.ExecuteQuery(query);

        int id = -1;

        if(set.equals(null))
        {
            //query for id
            query = String.format("INSERT INTO {0}({1}) VALUES({2})", tableName, paramName, value);
            this.ExecuteInsert(query);


            //return Id
            query = String.format("SELECT id FROM {0} WHERE {1} = {2}", tableName, paramName, value);
            set = this.ExecuteQuery(query);
        }

        try
        {
            while(set.next())
            {
                id = Integer.parseInt(set.getString("id").trim());
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }

        return id;
    }
}
