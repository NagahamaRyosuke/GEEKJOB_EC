<%-- 
    Document   : myupdate
    Created on : 2017/10/04, 13:48:18
    Author     : Ryosuke
--%>

<%@page import="kagoyume.UserDataDTO"
        import="kagoyume.KagoyumeHelper"%>
<%
    UserDataDTO user = (UserDataDTO)session.getAttribute("user");
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
            <h4>会員情報更新</h4>
            <form action="MyUpdateResult" method="POST" class="form-horizontal">
                <div class="form-group">
                    <label for="Name" class="control-label col-sm-2">ユーザー名:</label>
                    <div class="col-sm-5">
                        <input type="text" name="Name" value="<%=user.getName()%>" id="Name" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Password" class="control-label col-sm-2">パスワード:</label>
                    <div class="col-sm-5">
                        <input type="text" name="Password" value="<%=user.getPassword()%>" id="Password" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Mail" class="control-label col-sm-2">メールアドレス:</label>
                    <div class="col-sm-5">
                        <input type="text" name="Mail" value="<%=user.getMail()%>" id="Mail" class="form-control" required>
                    </div>
                </div> 
                <div class="form-group">
                    <label for="Address" class="control-label col-sm-2">住所:</label>
                    <div class="col-sm-5">
                        <input type="text" name="Address" value="<%=user.getAddress()%>" id="Address" class="form-control" required>
                    </div>
                </div>
                <input type="submit" name="btnSubmit" value="更新" class="btn btn-default col-sm-offset-2 col-sm-1">
            </form>
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
