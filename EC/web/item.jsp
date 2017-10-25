<%-- 
    Document   : item
    Created on : 2017/10/04, 13:20:49
    Author     : Ryosuke
--%>

<%@page import="kagoyume.UserDataDTO"
        import="java.util.ArrayList"
        import="com.fasterxml.jackson.databind.JsonNode"
        import="kagoyume.KagoyumeHelper"%>
<%
    JsonNode item = (JsonNode)session.getAttribute("item");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>かごゆめ</title>
    </head>
    <body>
        <h1 class="bg-success text-primary text-center">かごゆめ<br><small>どんなものでも購入できるECサイト</small></h1>
        <div class="container">
            <%= KagoyumeHelper.getInstance().login((UserDataDTO)session.getAttribute("user")) %>

            <div class="clearfix"></div>
            <h4>商品詳細</h4>
            <table class="table">
                <td>
                    <img border="0" src="<%=item.get("Image").get("Medium").asText()%>" width="300" height="300" alt="写真">
                </td>
                <td>
                    <div>
                        <b>商品名 </b><%=item.get("Name").asText()%>
                    </div>
                    <div>
                        <b>商品詳細 </b><%=item.get("Description").asText()%>
                    </div>
                    <div>
                        <b>評価 </b><%=item.get("Review").get("Rate").asText()%>
                    </div>
                    <div>
                        <b>価格 </b><%=item.get("Price").get("_value").asInt()%>円
                    </div>
                    <div>
                        <b>商品コード </b><%=item.get("Code").asText()%>
                    </div>
                </td>
            </table>
            <form action="Add" method="POST">
                <input type="submit" name="submit" value="カートに入れる" class="btn btn-default col-md-offset-4 col-md-3">
            </form>
            <form action="<%=request.getAttribute("URL")%>" method="POST">
                <input type="hidden" name="log"  value="log">
                <input type="submit" name="submit" value="戻る" class="btn btn-default col-md-offset-4 col-md-3">
            </form>    
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
