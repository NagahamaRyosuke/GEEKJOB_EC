<%-- 
    Document   : search
    Created on : 2017/10/04, 13:19:32
    Author     : Ryosuke
--%>

<%@page import="kagoyume.UserDataDTO"
        import="java.util.ArrayList"
        import="com.fasterxml.jackson.databind.JsonNode"
        import="kagoyume.KagoyumeHelper"%>
<%
    ArrayList<JsonNode> list = (ArrayList<JsonNode>)session.getAttribute("list");
    int offset=0;
    if(session.getAttribute("offset") != null){
        offset = (Integer)session.getAttribute("offset");
    }
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
            <form action="Search" method="GET">
                <div class="form-group">
                    <div class="col-xs-5">
                        <input type="text" name="keyword" value="<%=(String)session.getAttribute("keyword")%>" class="form-control col-md-offset-8">
                    </div>
                </div>
                <input type="submit" value="検索" class="btn btn-default col-md-offset-3 col-md-1">
            </form>
            
            <div class="clearfix"></div>
            <h4>検索結果 <%=request.getAttribute("search")%>件</h4>

            <table class="table table-hover">
                <%for(JsonNode node: list){ %>
                    <tr>
                        <td>
                            <img border="0" src="<%=node.get("Image").get("Small").asText()%>" width="128" height="128" alt="写真">
                        </td>
                        <td>
                            <a href="Item?id=<%=node.get("Code").asText()%>"><%=node.get("Name").asText()%></a><br>
                            <%=node.get("Price").get("_value").asInt()%>円
                        </td>
                    </tr>
                <%}%>
            </table>

            <div class="col-md-offset-5 h4">
                <% if(offset != 0){ %>
                    <a href="Search?offset=-<%=offset%>">前へ</a>・・・
                <% } %>
                <a href="Search?offset=<%=offset%>">次へ</a>
            </div>
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
