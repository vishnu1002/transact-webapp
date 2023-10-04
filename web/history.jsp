
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .table_view
            {
                position: absolute;
                margin-top: 60px;
                margin-left: 210px;
            }

            table
            {
                color: white;
                font-size: 9px;
            }

            td
            {
                width: 100px;
                height: 25px;
            }
        </style>
    </head>
    <body>
        
        <%@include  file="history.html" %>
        
        <%
        try
        {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            int sno;
            String username, payment;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transact", "root", "");
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from user_vishnu");

        %>
        <div class="table_view">
        <table>
        <%
            while(rs.next())
            {
                username = rs.getString(1);
                payment = rs.getString(2);
                System.out.println(" "+username+" "+payment);

            %>

                <tr>
                    <td><%= username %></td>
                    <td align="right"><%= payment %></td>
                </tr>

            <%

            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }

        %>
        </table>
        </div>
    </body>
</html>
