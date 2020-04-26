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
            #termek{
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
            function r2() {
                window.location.reload();
            }

        </script>

    </head>

    <body style="background-color: #555555" onload="reload()">
        <h1>4-es csapat WEBSHOP
            <a href="Hirdetesfeladas.html"><input id="bt1" type="button" value="Hirdetésfeladás" onclick=""></a>
            <%

                String username = (String) session.getAttribute("user");
                if (username == null) {
            %>
            <a href="Login.html"><input id="bt2" type="button" value="Belépés" onclick=""></a>
            <a href="registration.html"><input id="bt3" type="button" value="Regisztráció" onclick=""></h1></a>
                <% } else {
                %> <h1 id="belepve">Belepve: <%=username%></h1> <a href="LogOut"><input id="bt4" type="button" value="Kilepes" onclick=""></a>
                <%  }%>


            <input type="text" id="search" autocomplete="off" placeholder="Keresés...">
            <br>
            <select id="searchtype">
                <option value="" selected disabled hidden>Válassz</option>
                <option value="bicikli">bicikli</option>
                <option value="h?t?">huto</option>
                <option value="laptop">laptop</option>
            </select>
            <input id="searchbutton" type="image" src="nagyito.jpg" alt="Submit" width="30" height="25">



            <div id="kulso" class="row promo-products">

                <div id="termek" product-id="1" product-name="Bicikli" product-price="15000" category="Sport" auction-type="fix_price" freeshipping="1">

                    <img src="bicikli.jpg" height="20%" width="30%"/>
                    <div class="product-name">
                        <p >Ez egy bicikli, vedd meg!!</p>
                    </div>
                    <div class="vertical-line"></div>
                    <div class="price">
                        <p>15000 Ft</p>
                    </div>
                    <div class="erdekel">
                        <label for="erd">ÉRDEKEL
                            <input type="checkbox" id="erd" name="gender" value="male" style="background-color:black">
                            <span class="checkmark"></span>
                        </label><br>
                    </div>


                </div>
                <br><br>

                <div id="termek" product-id="1" product-name="Bicikli" product-price="15000" category="Sport" auction-type="fix_price" freeshipping="1">

                    <img src="bicikli.jpg" height="20%" width="30%"/>
                    <div class="product-name">
                        <p>Ez egy bicikli, vedd meg!!</p>
                    </div>
                    <div class="vertical-line"></div>
                    <div class="price">
                        <p>15000 Ft</p>
                    </div>
                    <div class="erdekel">
                        <label for="erd">ÉRDEKEL
                            <input type="checkbox" id="erd" name="gender" value="male" style="background-color:black">
                            <span class="checkmark"></span>
                        </label><br>
                    </div>


                </div>
                <br><br>

                <div id="termek" product-id="1" product-name="Bicikli" product-price="15000" category="Sport" auction-type="fix_price" freeshipping="1">

                    <img src="bicikli.jpg" height="20%" width="30%"/>
                    <div class="product-name">
                        <p>Ez egy bicikli, vedd meg!!</p>
                    </div>
                    <div class="vertical-line"></div>
                    <div class="price">
                        <p>15000 Ft</p>
                    </div>
                    <div class="erdekel">
                        <label for="erd">ÉRDEKEL
                            <input type="checkbox" id="erd" name="gender" value="male" style="background-color:black">
                            <span class="checkmark"></span>
                        </label><br>
                    </div>


                </div>
                <br><br>

                <div id="termek" product-id="1" product-name="Bicikli" product-price="15000" category="Sport" auction-type="fix_price" freeshipping="1">

                    <img src="bicikli.jpg" height="20%" width="30%"/>
                    <div class="product-name">
                        <p>Ez egy bicikli, vedd meg!!</p>
                    </div>
                    <div class="vertical-line"></div>
                    <div class="price">
                        <p>15000 Ft</p>
                    </div>
                    <div class="erdekel">
                        <label for="erd">ÉRDEKEL
                            <input type="checkbox" id="erd" name="gender" value="male" style="background-color:black">
                            <span class="checkmark"></span>
                        </label><br>
                    </div>


                </div>
                <br><br>

                <div id="termek" product-id="1" product-name="Bicikli" product-price="15000" category="Sport" auction-type="fix_price" freeshipping="1">

                    <img src="bicikli.jpg" height="20%" width="30%"/>
                    <div class="product-name">
                        <p>Ez egy bicikli, vedd meg!!</p>
                    </div>
                    <div class="vertical-line"></div>
                    <div class="price">
                        <p>15000 Ft</p>
                    </div>
                    <div class="erdekel">
                        <label for="erd">ÉRDEKEL
                            <input type="checkbox" id="erd" name="gender" value="male" style="background-color:black">
                            <span class="checkmark"></span>
                        </label><br>
                    </div>


                </div>
                <br><br>

                <div id="termek" product-id="1" product-name="Bicikli" product-price="15000" category="Sport" auction-type="fix_price" freeshipping="1">

                    <img src="bicikli.jpg" height="20%" width="30%"/>
                    <div class="product-name">
                        <p>Ez egy bicikli, vedd meg!!</p>
                    </div>
                    <div class="vertical-line"></div>
                    <div class="price">
                        <p>15000 Ft</p>
                    </div>
                    <div class="erdekel">
                        <label for="erd">ÉRDEKEL
                            <input type="checkbox" id="erd" name="gender" value="male" style="background-color:black">
                            <span class="checkmark"></span>
                        </label><br>
                    </div>


                </div>
                <br><br><br>

            </div>




    </body>
</html>
