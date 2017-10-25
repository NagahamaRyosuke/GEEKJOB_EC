<%-- 
    Document   : registration
    Created on : 2017/10/04, 13:21:59
    Author     : Ryosuke
--%>

<%@page import="kagoyume.KagoyumeHelper"
        import="kagoyume.UserData"%>
<%
    UserData ud = null;
    boolean reinput = false;
    if(request.getParameter("mode") != null && request.getParameter("mode").equals("REINPUT")){
        reinput = true;
        ud = (UserData)session.getAttribute("ud");
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
            <h4>会員登録</h4>
            <form action="RegistrationConfirm" method="POST" class="form-horizontal">
                <div class="form-group">
                    <label for="Name" class="control-label col-sm-2">ユーザー名:</label>
                    <div class="col-sm-5">
                        <input type="text" name="Name" value="<% if(reinput){out.print(ud.getName());}%>" id="Name" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="Password" class="control-label col-sm-2">パスワード:</label>
                    <div class="col-sm-5">
                        <input type="text" name="Password" value="<% if(reinput){out.print(ud.getPassword());}%>" id="Password" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="Mail" class="control-label col-sm-2">メールアドレス:</label>
                    <div class="col-sm-5">
                        <input type="text" name="Mail" value="<% if(reinput){out.print(ud.getMail());}%>" id="Mail" class="form-control">
                    </div>
                </div>    
                <div class="form-group">
                    <label for="Address" class="control-label col-sm-2">住所:</label>
                    <div class="col-sm-5">
                        <input type="text" name="Address" value="<% if(reinput){out.print(ud.getAddress());}%>" id="Address" class="form-control">
                    </div>
                </div>   
                <input type="submit" name="btnSubmit" value="確認画面へ" class="btn btn-default col-sm-offset-2 col-sm-1">
            </form>
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
