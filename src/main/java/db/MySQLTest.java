package db;

import com.mysql.jdbc.Driver;
import util.DB;

import java.sql.*;

/**
 * Created by Administrator on 2015/3/29.
 */

//JDBC - Java DataBase Connectivity
public class MySQLTest {// Alt + Enter quick fix
    public static void main(String[] args) {// psvm + Enter
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
//        1.    准备数据库驱动 driver jar: http://search.maven.org/
//        2.    取得数据库连接（数据库连接参数）
            connection = DB.getConnection();
//            System.out.println(connection);
//        3.    CRUD操作
//            CRUD - C
//            String create = "INSERT INTO words VALUES(NULL, '苹果', 'apple', 'N', 'apple tree...')";
//            PreparedStatement preparedStatement = connection.prepareStatement(create);
//            CRUD - U
//            String update = "UPDATE words SET properties = '名词' where id = 3";
//            PreparedStatement preparedStatement = connection.prepareStatement(update);
//            CRUD - D
//            String delete = "delete from words WHERE id = 3";
//            PreparedStatement preparedStatement = connection.prepareStatement(delete);
//            CRUD - R
//            String retrieve = "SELECT * FROM words";
//            while (resultSet.next()) {
//                System.out.println(resultSet.getString("english") + ", " + resultSet.getString("chinese"));
//            }
            String login = "SELECT * FROM admin WHERE username=? and password=?";// SQL Injection
            preparedStatement = connection.prepareStatement(login);
            preparedStatement.setString(1, "zhangsan");
            preparedStatement.setString(2, "123");
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                System.out.println("login...");
            } else {
                System.out.println("error.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //        4.    释放打开的资源
            DB.close(resultSet, preparedStatement, connection);
        }
    }
}
