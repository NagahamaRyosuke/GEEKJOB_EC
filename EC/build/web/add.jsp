<%-- 
    Document   : add
    Created on : 2017/10/04, 13:21:09
    Author     : Ryosuke
--%>

<%@page import="kagoyume.KagoyumeHelper"
        import="kagoyume.UserDataDTO"%>
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
            <h3 class="text-center">
                カートに追加しました。<br> 
                <%=request.getAttribute("item")%>
            </h3>
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
