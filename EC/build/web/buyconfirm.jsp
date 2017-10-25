<%-- 
    Document   : buyconfirm
    Created on : 2017/10/04, 13:25:47
    Author     : Ryosuke
--%>

<%@page import="java.util.ArrayList"
        import="com.fasterxml.jackson.databind.JsonNode"
        import="kagoyume.KagoyumeHelper"
        import="kagoyume.UserDataDTO"%>
<%
    UserDataDTO user = (UserDataDTO)session.getAttribute("user"); 
    ArrayList<JsonNode> cart = (ArrayList<JsonNode>)session.getAttribute(user.getName());
    int total = 0;
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
            <h4>買い物かご</h4>
            
            <table class="table table-striped">
            <% for(JsonNode node: cart){ %>
                <tr>
                    <td>
                        <%=node.get("Name").asText()%>
                    </td>
                    <td>
                        <%=node.get("Price").get("_value").asInt()%>円
                    </td>
                </tr>
                <%total += node.get("Price").get("_value").asInt();%>
            <% } %>
            </table>

            <h4 class="text-center">合計金額:<%=total%>円</h4>

            <% if(request.getAttribute("error") != null){ %>
                <h4 class="text-center text-danger">発送方法を入力してください。</h4>
            <% } %>

            <form action="BuyComplete" method="POST">
                <h4>発送方法</h4>
                <div class="form-group">
                    <input type="radio" name="type" value="1">ヤマト
                    <input type="radio" name="type" value="2">佐川
                </div>
                <input type="submit" value="上記の内容で購入する" class="btn btn-default col-sm-offset-5 col-sm-2">
            </form>
            <form action="Cart" method="POST">
                <input type="submit" value="カートに戻る" class="btn btn-default col-sm-offset-5 col-sm-2">
            </form>
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
