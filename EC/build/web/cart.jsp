<%-- 
    Document   : cart
    Created on : 2017/10/04, 13:24:01
    Author     : Ryosuke
--%>

<%@page import="kagoyume.UserDataDTO"
        import="java.util.ArrayList"
        import="com.fasterxml.jackson.databind.JsonNode"
        import="kagoyume.KagoyumeHelper"%>
<%
    UserDataDTO user = (UserDataDTO)session.getAttribute("user"); 
    ArrayList<JsonNode> userCart = (ArrayList<JsonNode>)session.getAttribute(user.getName());
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
            <%= KagoyumeHelper.getInstance().login(user) %>

            <div class="clearfix"></div>
            <% if(userCart != null && !userCart.isEmpty()){ %>
                <h4>買い物かご</h4>
                
                <table class="table table-striped">
                    <%for(int i=0; i<userCart.size(); i++){
                        JsonNode node = userCart.get(i);%>
                        <tr>
                            <td>
                                <a href="Item?id=<%=node.get("Code").asText()%>"><%=node.get("Name").asText()%></a>
                            </td>
                            <td>
                                <%=node.get("Price").get("_value").asInt()%>円
                            </td>
                            <td>
                                <a href="Cart?remove=<%=i%>">削除</a>
                            </td>
                        </tr>
                        <%total += node.get("Price").get("_value").asInt();%>
                    <% } %>
                </table>

                <h4 class="text-center">合計金額:<%=total%>円</h4>
                
                <form action="BuyConfirm" method="POST">
                    <input type="submit" value="購入" class="btn btn-default col-sm-offset-5 col-sm-2">
                </form>
            <% } else { %>
                <h4 class="text-center">何も入っていません。</h4>
            <% } %>
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
