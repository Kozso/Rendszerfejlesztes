<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <title>4-es csapat</title>

        <style>
            #bt1, #bt2, #bt3 {
                background-color: #e8e8e8;
                border: none;
                color: black;
                padding: 10px 20px;
                text-align: center;
                font-size: 15px;
                cursor: pointer;
                border-radius: 8px;

                position: absolute;
                top: 30px;
            }
            #bt1{
                right: 350px;
            }
            #bt2{
                right: 100px;
            }
            #bt3{
                right: 200px;
            }
            #bt:hover {
                background-color: whitesmoke;
            }
            #search{
                width: 25%;
                position: absolute;
                top: 140px;
                left: 350px;
                padding: 10px 20px;
                font-size: 18px;
                background-color: #e8e8e8;
            }
            #searchtype{
                width: 9%;
                position: absolute;
                top: 140px;
                left: 800px;
                padding: 10px 20px;
                font-size: 18px;
                background-color: #e8e8e8;
            }
            #searchbutton{
                position: absolute;
                top: 140px;
                left: 950px;
                padding: 10px 10px;
                font-size: 18px;
                background-color: #ffffff;
            }
            #kulso{
                position: absolute;
                top: 300px;
                left: 100px;
            }
            #td{
                border: 2px solid black;
                background-color: #cccccc;
                position: relative;
                right: 100px;
                padding: 5px;
                margin: auto;
                width: 80%;
                display: block;
            }
            .product-name{
                position: absolute;
                bottom: 90px;
                right: 300px;
                font-size: 25px;
            }
            .vertical-line {
                border-left: 5px solid #5d5d5d;
                height: 161px;
                position: absolute;
                top: 0px;
                left: 600px;
            }
            .price{
                position: absolute;
                top: 0px;
                right: 80px;
                font-size: 20px;
            }
            .erdekel{
                position: absolute;
                bottom: 10px;
                right: 50px;
                font-size: 20px;
            }
            #erd{
                position: absolute;
                bottom: 0px;
                right: 90px;
                height: 25px;
                width: 25px;
                display: block;
                border: 3px solid black;
            }
            #belepve{
                text-align: center;
            }
        </style>


        <script>


            //window.onload = function () {window.location.reload()}
//            function bodyTable() {
//
//                var mysql = require('mysql');
//                var connection = mysql.createConnection({
//                    host: 'jdbc:mysql://localhost:3306/',
//                    database: 'webshop_db',
//                    user: 'root',
//                    password: '',
//                });
//
//                connection.connect(function (err) {
//                    if (err) {
//                        console.error('Error connecting: ' + err.stack);
//                        document.getElementById("p").innerHTML = "Vesztettel!";
//                        return;
//                    }
//
//                    console.log('Connected as id ' + connection.threadId);
//                });
//
//                connection.query('SELECT * FROM termekek', function (error, results, fields) {
//                    if (error)
//                        throw error;
//
//                    results.forEach(result => {
//                        console.log(result);
//                    });
//                });
//
//                connection.end();
//                
//                var body = document.getElementById("kulso");
//
//                var table = document.createElement('TABLE');
//                table.border = '1';
//
//                var tableBody = document.createElement('TBODY');
//                table.appendChild(tableBody);
//                var i;
//                for (var i = 0; i < 5; i++) {
//                    var tr = document.createElement('TR');
//                    tableBody.appendChild(tr);
//
//                    for (var j = 0; j < 3; j++) {
//                        //KÉPBESZURAS
////                            IF(J=1)
////                            //lEIRAS
////                            IF(J=2)
////                            //GOmb
////                            IF(J=3)
//                        var td = document.createElement('TD');
//
//                        td.setAttribute("id", (i * 10 + j + 1));
//                        td.width = '75';
//                        td.appendChild(document.createTextNode(i * 10 + j + 1));
//                        tr.appendChild(td);
//
//                    }
//
//                }
//                body.appendChild(table);
//
//            }

        </script>

    </head>

    <body id="body "style="background-color: #555555" >

        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        <%@ page import="java.sql.*"%>
        <%@ page import="java.io.*"%>

        <%
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "webshop_db";
            String userId = "root";
            String password = "";

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            ResultSet searchSelect = null;

            String search = "*";

            connection = DriverManager.getConnection(
                    connectionUrl + dbName, userId, password);


        %>

        <%!
            public void searchMod() {

            }%>
        <h1><center>4-es csapat WEBSHOP</center>

            <% String username = (String) session.getAttribute("user");
                if (username == null) {
            %>
            <a href="Login.html"><input id="bt2" type="button" value="Belépés" onclick=""></a>
            <a href="registration.html"><input id="bt3" type="button" value="Regisztráció" onclick=""></h1></a>
                <% } else {
                %> <a href="Hirdetesfeladas.html"><input id="bt1" type="button" value="Hirdetésfeladás" onclick=""></a>
            <h1 id="belepve">Belepve: <%=username%></h1> <a href="LogOut"><input id="bt4" type="button" value="Kilepes" onclick=""></a>
                <%  }%>


            <input type="text" id="search" autocomplete="off" placeholder="Keresés...">
            <br>
            <form name="f1" method="get" action="#">
                <select id="select" name="select">
                    <option>List all item</option>
                    <%
                        statement = connection.createStatement();
                        String sql = "SELECT distinct kategoria FROM termekek";
                        searchSelect = statement.executeQuery(sql);

                        while (searchSelect.next()) {%>
                    <option ><%= searchSelect.getString(1)%></option>
                    <% } %>
                </select>
                <input id="searchbutton" type="image" src="nagyito.jpg" alt="Submit" width="30" height="25"
                       >
            </form>





            <table align="center" cellpadding="4" cellspacing="4">
                <tr>

                </tr>
                <tr bgcolor="#008000">
                    <td><b>Id</b></td>
                    <td><b>Nev</b></td>
                    <td><b>kategoria</b></td>
                    <td><b>leiras </b></td>
                    <td><b>allapot</b></td>
                    <td><b>ar</b></td>
                    <td><b>kep1</b></td>
                    <td><b>felh_id</b></td>
                    <td><b>Vasarlas</b></td>

                </tr>
                <%
                    try {

                        statement = connection.createStatement();
                        sql = "SELECT * FROM termekek ";
                        String s = request.getParameter("select");
                        System.out.println(s);
                        if (s != null) {
                            search = s;
                            sql = "SELECT * FROM termekek where kategoria='" + search + "'";
                        }
                        System.out.println(s);

                        resultSet = statement.executeQuery(sql);

                        while (resultSet.next()) {

                %>
                <tr>

                    <td name="termek_id"><%=resultSet.getString("termek_id")%></td>
                    <td name="termek_nev"><%=resultSet.getString("nev")%></td>
                    <td><%=resultSet.getString("kategoria")%></td>
                    <td><%=resultSet.getString("leiras")%></td>
                    <td><%=resultSet.getString("allapot")%></td>
                    <td name="termek_ar"><%=resultSet.getString("ar")%></td>
                    <td>
                        <img src="<%=resultSet.getString("kep1")%>" height="100" width="100"/> 
                    </td>
                    <td><%=resultSet.getString("felh_id")%></td>
                    <td><form action="kosarbaServlet" method="POST"><input name="termek_id" type="hidden" value="<%=resultSet.getString("termek_id")%>" ><button id="bt" type="submit">Kosarba rak</button></form> 
                    </td>

                </tr>

                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <!--            ---------------------------------------------------------------->
            <br><br><br><br>

            <%
                if (username!=null) {


            %>
            <h1>Kosar</h1>
            <table align="center" cellpadding="4" cellspacing="4">
                <tr>

                </tr>
                <tr bgcolor="#008000">
                    <td><b>Id</b></td>
                    <td><b>Nev</b></td>
                    <td><b>kategoria</b></td>
                    <td><b>leiras </b></td>
                    <td><b>allapot</b></td>
                    <td><b>ar</b></td>
                    <td><b>kep1</b></td>
                    <td><b>felh_id</b></td>
                    <td><b>Vasarlas</b></td>

                </tr>
                <%                    try {

                        statement = connection.createStatement();
                        sql = "SELECT kosar.kosar_id, termekek.termek_id, termekek.nev,termekek.kategoria,termekek.leiras,termekek.allapot,termekek.ar, termekek.kep1, termekek.felh_id FROM kosar left join termekek on kosar.termek_id=termekek.termek_id where kosar.felh_id=" + (String) session.getAttribute("user_id") + " and termekek.vasarlas_id is null";

                        resultSet = statement.executeQuery(sql);

                        while (resultSet.next()) {

                %>
                <tr>
                <form>
                    
                </form>
                    <td ><%=resultSet.getString("termekek.termek_id")%></td>
                    <td ><%=resultSet.getString("termekek.nev")%></td>
                    <td><%=resultSet.getString("termekek.kategoria")%></td>
                    <td><%=resultSet.getString("termekek.leiras")%></td>
                    <td><%=resultSet.getString("termekek.allapot")%></td>
                    <td name="termek_ar"><%=resultSet.getString("termekek.ar")%></td>
                    <td>
                        <img src="<%=resultSet.getString("termekek.kep1")%>" height="100" width="100"/> 
                    </td>
                    <td><%=resultSet.getString("termekek.felh_id")%></td>
                    <td><form action="kosarTorlesServlet" method="POST"><input name="kosar.kosar_id" type="hidden" value="<%=resultSet.getString("kosar.kosar_id")%>" ><button id="bt" type="submit">Torles</button></form> 
                    </td>

                </tr>

                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <div><></div>
            </table>

            <%
                }
            %>

            <p id="p">...</p>


    </body>
</html>
