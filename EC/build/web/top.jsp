<%-- 
    Document   : top
    Created on : 2017/10/04, 13:17:56
    Author     : Ryosuke
--%>

<%@page import="kagoyume.UserDataDTO"
        import="kagoyume.KagoyumeHelper"%>
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
                        <input type="text" name="keyword" placeholder="Keyword" class="form-control col-md-offset-8">
                    </div>
                </div>
                <input type="submit" value="検索" class="btn btn-default col-md-offset-3 col-md-1">
            </form>
            
            <div class="clearfix"></div>
            <h4 class="text-center text-danger">
                <% if(request.getAttribute("error") != null){ %>
                    キーワードを入力してください
                <% } %>
            </h4>
        </div>
    </body>
</html>
