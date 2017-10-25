<%-- 
    Document   : myupdateresult
    Created on : 2017/10/04, 13:48:48
    Author     : Ryosuke
--%>

<%@page import="kagoyume.UserDataDTO"
        import="kagoyume.KagoyumeHelper"%>
<%
    UserDataDTO user =(UserDataDTO)session.getAttribute("user");
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
            <h4>更新完了</h4>
            <table class="table table-striped">
                <tr>
                    <td class="col-xs-2">
                        名前
                    </td>
                    <td>
                        <%= user.getName()%>
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-2">
                        パスワード
                    </td>
                    <td>
                        <%= user.getPassword()%>
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-2">
                        メールアドレス
                    </td>
                    <td>
                        <%= user.getMail()%>
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-2">
                        住所
                    </td>
                    <td>
                        <%= user.getAddress()%>
                    </td>
                </tr>
            </table>
            以上の内容で更新しました。<br>
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
