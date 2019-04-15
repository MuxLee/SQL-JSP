package DBPKG;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dbconnection {

	public static Connection dbconnection () throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
		return conn;
	}
	
	public static PreparedStatement RePstmt (String args) throws Exception {
		Connection conn = dbconnection();
		PreparedStatement pstmt = conn.prepareStatement(args);
		return pstmt;
	}
	
	public static ResultSet ReRs (String args) throws Exception {
		Connection conn = dbconnection();
		ResultSet rs = conn.prepareStatement(args).executeQuery();
		return rs;
	}
	
}
