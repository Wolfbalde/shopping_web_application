import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class item {
	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Akaash", "maximo");
		Statement st = con.createStatement();
		st.executeQuery("create table Item(Name varchar2(200),Quantity int,Price int)");
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
