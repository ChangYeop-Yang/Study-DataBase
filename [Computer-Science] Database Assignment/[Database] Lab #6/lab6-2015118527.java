package db_prog;
import java.io.*;
import java.sql.*; // import JDBC package

public class TestJDBC {
	
	// TODO : - Oracle Information
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String USER_KNU ="knu";
	public static final String USER_PASSWD ="comp322";
	public static final String TABLE_NAME = "TEST";
	
	// TODO: - Oracle Variables
	private static Connection conn = null; // Connection object
	
	public static void main(String[] args) throws SQLException {
		
		// TODO: - Oracle Database Connect
		connectOrcle();
		
		// TODO: - Oracle Database Create Table
		execteOrcle(TableObject.CREATE_EMPLOYEE_TABLE);
		execteOrcle(TableObject.CREATE_DEPARTMENT_TABLE);
		execteOrcle(TableObject.CREATE_DEPT_LOCATIONS_TABLE);
		execteOrcle(TableObject.CREATE_PROJECT_TABLE);
		execteOrcle(TableObject.CREATE_DEPENDENT);
		execteOrcle(TableObject.CREATE_WORKS_ON);
		
		// TODO: - Oracle Database Insert Table
		readCompanyFiles("src/company.txt");
		
		conn.close();
	}
	
	// TODO : - Oracle Connect Method
	private static void readCompanyFiles(final String file) {
		
		try {
			final BufferedReader mBufferedReader = new BufferedReader(new FileReader(file));
			
			for (String line = mBufferedReader.readLine(); line != null; line = mBufferedReader.readLine()) {
				
				if (line.charAt(0) == '$') {
					final String tableName = line.substring(1, line.length());
					line = mBufferedReader.readLine();
					
					final String[] insertDatas = line.split("#");
					switch(tableName) {
						case ("DEPARTMENT") : {
							final String query = String.format("INSERT INTO %s VALUES ('%s', %s, '%s', TO_DATE('%s', 'yyyy-mm-dd'))", tableName, insertDatas[0], insertDatas[1], insertDatas[2], insertDatas[3]);
							execteOrcle(query);
							break;
						}
						case ("EMPLOYEE") : {
							final String query = String.format("INSERT INTO %s VALUES ('%s', '%s', '%s', '%s', TO_DATE('%s', 'yyyy-mm-dd'), '%s', '%s', %s, '%s', %s)", tableName, insertDatas[0], insertDatas[1], insertDatas[2], insertDatas[3], insertDatas[4], insertDatas[5], insertDatas[6], insertDatas[7], insertDatas[8], insertDatas[9]);
							execteOrcle(query);
							break;
						}
						case ("PROJECT"): {
							final String query = String.format("INSERT INTO %s VALUES ('%s', %s, '%s', %s)", tableName, insertDatas[0], insertDatas[1], insertDatas[2], insertDatas[3]);
							execteOrcle(query);
							break;
						}
						case ("DEPT_LOCATIONS") : {
							final String query = String.format("INSERT INTO %s VALUES (%s, '%s')", tableName, insertDatas[0], insertDatas[1]);
							execteOrcle(query);
							break;
						}
						case ("WORKS_ON") : {
							final String query = String.format("INSERT INTO %s VALUES ('%s', %s, %s)", tableName, insertDatas[0], insertDatas[1], insertDatas[2]);
							execteOrcle(query);
							break;
						}
						case ("DEPENDENT") : {
							final String query = String.format("INSERT INTO %s VALUES ('%s', '%s', '%s', TO_DATE('%s', 'yyyy-mm-dd'), '%s')", tableName, insertDatas[0], insertDatas[1], insertDatas[2], insertDatas[3], insertDatas[4]);
							execteOrcle(query);
							break;
						}
					}	
				}
			}
			
		} catch (FileNotFoundException e) {
			System.err.println("BufferedReader FileNotFoundException Error" + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("BufferedReader IOException Error" + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("BufferedReader SQLException Error" + e.getMessage());
			e.printStackTrace();
		}
	}
	private static void connectOrcle() {
		
		// Load a JDBC driver for Oracle DBMS
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Orcle Database Success!");
		} catch(ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}

		// Make a connection
		try {
			conn = DriverManager.getConnection(URL, USER_KNU, USER_PASSWD);
			conn.setAutoCommit(false);
		} catch(SQLException ex) {
			System.err.println("Cannot get a connection: " + ex.getMessage());
			System.exit(1);
		}
		
	}
	private static void execteOrcle(final String query) throws SQLException {
		
		// TODO: - Oracle Variables
		final Statement stmt = conn.createStatement();	// Statement object
		
		try { stmt.executeUpdate(query); conn.commit(); System.out.println("¡Ø Query - " + query); }
		finally { stmt.close(); } 
	}

	public class TableObject {	
		final static String CREATE_EMPLOYEE_TABLE = "CREATE TABLE EMPLOYEE ( " + 
				"	Fname	VARCHAR(15)	NOT NULL," + 
				"	Minit	CHAR," + 
				"	Lname	VARCHAR(15)," + 
				"	Ssn	CHAR(9)," + 
				"	Bdate	DATE," + 
				"	Address	VARCHAR(30)," + 
				"	Sex	CHAR," + 
				"	Salary	NUMBER(10,2)," + 
				"	Super_ssn	CHAR(9)," + 
				"	Dno	NUMBER DEFAULT 1 NOT NULL," + 
				"	PRIMARY KEY	(Ssn)" + 
				")";
		final static String CREATE_DEPARTMENT_TABLE = "CREATE TABLE DEPARTMENT(" + 
				"	Dname		VARCHAR(15)	NOT NULL," + 
				"	Dnumber		NUMBER		NOT NULL," + 
				"	Mgr_ssn		CHAR(9)		DEFAULT '888665555' NOT NULL," + 
				"	Mgr_start_date	DATE," + 
				"	PRIMARY KEY	(Dnumber)," + 
				"	UNIQUE		(Dname)" +
				")";
		final static String CREATE_DEPT_LOCATIONS_TABLE = "CREATE TABLE DEPT_LOCATIONS(" + 
				"	Dnumber		NUMBER		NOT NULL," + 
				"	Dlocation		VARCHAR(15)	NOT NULL," + 
				"	PRIMARY KEY	(Dnumber, Dlocation)," + 
				"	FOREIGN KEY	(Dnumber) REFERENCES DEPARTMENT(Dnumber)" + 
				")";
		final static String CREATE_PROJECT_TABLE = "CREATE TABLE PROJECT(" + 
				"	Pname		VARCHAR(15)	NOT NULL," + 
				"	Pnumber		NUMBER		NOT NULL," + 
				"	Plocation		VARCHAR(15)," + 
				"	Dnum		NUMBER 		NOT NULL," + 
				"	PRIMARY KEY	(Pnumber)," + 
				"	UNIQUE		(Pname)," + 
				"	FOREIGN KEY 	(Dnum) REFERENCES DEPARTMENT(Dnumber)" + 
				")";
		final static String CREATE_DEPENDENT = "CREATE TABLE DEPENDENT(" + 
				"	Essn		CHAR(9)		NOT NULL," + 
				"	Dependent_name	VARCHAR(15)	NOT NULL," + 
				"	Sex		CHAR," + 
				"	Bdate		DATE," + 
				"	Relationship	VARCHAR(8)," + 
				"	PRIMARY KEY	(Essn, Dependent_name)," + 
				"	FOREIGN KEY	(Essn) REFERENCES EMPLOYEE(Ssn)" + 
				")";
		final static String CREATE_WORKS_ON = "CREATE TABLE WORKS_ON(" + 
				"	Essn	CHAR(9)		NOT NULL," + 
				"	Pno	NUMBER		NOT NULL," + 
				"	Hours	NUMBER(3,1)," + 
				"	PRIMARY KEY	(Essn, Pno)," + 
				"	FOREIGN KEY	(Essn) 	REFERENCES EMPLOYEE(Ssn)," + 
				"	FOREIGN KEY	(Pno) 	REFERENCES PROJECT(Pnumber)" + 
				")";

	}
}