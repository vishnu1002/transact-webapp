
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            th, td
            {
                height:30px;
                width:90px;
            }
            th
            {
                text-align: left;
            }
        </style>
        
    </head>
    <body>
        <h2>Registered Members</h2>
        
        <%
        try
        {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            int sno;
            String username, password, balance, card;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transact", "root", "");
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from user_register");

            %>
            
            <table>
                <tr>
                    <th>Sno</th>
                    <th>User</th>
                    <th>Pass</th>
                    <th>Balance</th>
                    <th>Card No</th>
                </tr>
            
            <%
            while(rs.next())
            {
                sno = rs.getInt(1);
                username = rs.getString(2);
                password = rs.getString(3);
                balance = rs.getString(4);
                card = rs.getString(5);
                System.out.println(username+" "+password+" "+balance+" "+card);
                
            %>
                
                <tr>
                    <td><%= sno %></td>
                    <td><%= username %></td>
                    <td><%= password %></td>
                    <td><%= balance %></td>
                    <td><%= card %></td>
                </tr>
                
            <%
                
            }
            
            %>
            </table>
            <%
            
            PreparedStatement ps = con.prepareStatement("select * from user_register where username = ? and password = ?");
            ps.setString(1, user);
            ps.setString(2, pass);
            System.out.println(ps);
            rs = ps.executeQuery();
            
            boolean status = rs.next();

            if (status) 
            {
                out.print("<h1>Logged in...</h1>");
                response.sendRedirect("dashboard.html");
            }
            else
            {
                out.print("<h1>User not found!</h1>");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }

        %>
        
        
        
        
    </body>
</html>
