<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Clinic Master (Patient)</title>
  </head>
  <body>
    <h1>Clinic Master (Patient)</h1>
    
    <table border="1">
      <tr>
        <td>SJSU ID</td>
        <td>Name</td>
        <td>Major</td>
   </tr>
    <% 
     String db = "";
        String user; // assumes database name is the same as username
          user = "";
        String password = "";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            out.println("Initial entries in table \"Student\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Student");
            while (rs.next()) {
                out.println(rs.getInt(1) + "    " + rs.getString(2) + "    " + rs.getString(3) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
