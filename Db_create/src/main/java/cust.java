import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class cust {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Akaash", "maximo");
		Statement st = con.createStatement();
		st.executeQuery("create table Cust(Name varchar2(20),Gender varchar2(20),DOB varchar2(20),Email varchar2(50),Address varchar2(1000),password varchar2(1000))");
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
