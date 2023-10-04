
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap" rel="stylesheet">
    <style> @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap'); </style>

    <link rel="stylesheet" href="balance.css">
    <title>Transact | Balance</title>
</head>
<body>
    
    <%
        try
        {
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            int sno;
            String username="", password, balance, card="", bal="";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transact", "root", "");
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from user_register");
            
            PreparedStatement ps = con.prepareStatement("select balance_amount, card_no from user_register where username = ?");
            ps.setString(1, user);
            
            rs = ps.executeQuery();
            
            
            //System.out.println("" + card);
            //System.out.println("" + user);

    %>
    
    <div class="logo">
        <a href="dashboard.html">
            <h5>Transact</h5>    
        </a>
    </div>

    <div class="container">

        <div class="button_group">
            <a href="dashboard.html">
                <button class="button">Pay</button>
            </a> <br>
            <a href="balance.jsp">
                <button class="button">Balance</button>
            </a> <br>
            <a href="history.jsp">
                <button class="button">History</button>
            </a> <br>
        </div>

        <%
            while(rs.next())
            {
                bal = rs.getString(1);
                card = rs.getString(2);
            }
        %>
        
        <h2 class="amount" >₹ 674,873.43</h2>

        <div class="card">
            <div class="card_logo">
                <svg stroke-width="1" viewBox="0 0 24 24" height="25" width="25">
                    <path d="M15.26465,5.27441a6.68141,6.68141,0,0,0-3.27295.85505,6.72754,6.72754,0,1,0,0,11.745,6.72551,6.72551,0,1,0,3.27295-12.6ZM10.23712,16.457a4.66714,4.66714,0,0,1-1.51837.27252,4.72754,4.72754,0,0,1,0-9.45508,4.66688,4.66688,0,0,1,1.51837.27253,6.68737,6.68737,0,0,0,0,8.91ZM11.9917,15.3996a4.69542,4.69542,0,0,1,0-6.79529,4.69542,4.69542,0,0,1,0,6.79529Zm3.27295,1.32989a4.66709,4.66709,0,0,1-1.51837-.27252,6.68737,6.68737,0,0,0,0-8.91,4.66683,4.66683,0,0,1,1.51837-.27253,4.72754,4.72754,0,0,1,0,9.45508Z"/>
                </svg>
            </div>

            <p class="card_no">5343 1111 4071 0443</p>
            <p class="card_no"><%=card%></p>
            
            <p class="card_name">Vishnu</p>
        </div>

    </div>
            
        <%
                    }
        catch(Exception e)
        {
            System.out.println(e);
        }
        %>
            
</body>
</html>
