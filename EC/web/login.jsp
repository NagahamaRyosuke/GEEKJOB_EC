<%-- 
    Document   : login
    Created on : 2017/10/04, 13:21:35
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
            <% if(session.getAttribute("user") == null){ %>
                <h4>ログイン</h4>
                
                <h4 class="text-center text-danger">
                    <% if(request.getAttribute("login") != null){ %>
                        ユーザー名・パスワードが間違っています。
                    <% } %>
                    <% if(request.getAttribute("delete") != null){ %>
                        削除されています。
                    <% } %>
                </h4>
                
                <form action="Login" method="POST" class="form-horizontal">
                    <div class="form-group">
                        <label for="name" class="control-label col-sm-2">ユーザー名:</label>
                        <div class="col-sm-5">
                            <input type="text" name="Name" value="" required id="name" class="form-control">
                        </div>
                    </div>    
                    <div class="form-group">
                        <label for="pasword" class="control-label col-sm-2">パスワード:</label>
                        <div class="col-sm-5">
                            <input type="text" name="Password" value="" required id="pasword" class="form-control">
                        </div>
                    </div> 
                        <input type="submit" name="login" value="logIN" class="btn btn-default col-sm-offset-2 col-sm-1">
                        <input type="hidden" name="URL" value="<%=request.getAttribute("URL")%>">
                </form>
                
                <div class="clearfix"></div>
                <div class="col-sm-offset-2">
                    <a href="Registration">新規会員登録</a>
                </div>
                
            <% } else { %>
                <h4 class="text-center">ログアウト</h4>
                <form action="Login" method="POST">
                    <input type="submit" name="logout" value="logOUT" class="btn btn-default col-sm-offset-5 col-sm-2">
                </form>
            <% } %>
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
