import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// DBConnection class allows us to connect to our oracle database, so that other parts of our program can easily connect to it
public class DBConnection {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521/XE"; // this url is to connect to the local oracle database
    private static final String USER = "system";
    private static final String PASSWORD = "oracle";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
