package db;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Administrator on 2015/3/29.
 */
public class MySQLTest {// Alt + Enter quick fix

    private static final String URL = "jdbc:mysql://127.0.0.1:3306/c";
    private static final String USER = "root";// Shift + Ctrl + U
    private static final String PASSWORD = "system";

    public static void main(String[] args) {// psvm + Enter
        try {
//        1.    准备数据库驱动 driver jar: http://search.maven.org/
            new Driver();
//        2.    取得数据库连接（数据库连接参数）
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
//            System.out.println(connection);
//        3.    CRUD操作
//            CRUD - C
            String create = "INSERT INTO words VALUES(NULL, '苹果', 'apple', 'N', 'apple tree...')";
            PreparedStatement preparedStatement = connection.prepareStatement(create);
            preparedStatement.executeUpdate();
//        4.    释放打开的资源
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
