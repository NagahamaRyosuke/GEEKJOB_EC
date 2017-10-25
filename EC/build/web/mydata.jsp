<%-- 
    Document   : mydata
    Created on : 2017/10/04, 13:47:39
    Author     : Ryosuke
--%>

<%@page import="kagoyume.KagoyumeHelper"
        import="kagoyume.UserDataDTO"%>
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
            <%= KagoyumeHelper.getInstance().login((UserDataDTO)session.getAttribute("user")) %>

            <div class="clearfix"></div>
            <h4>会員情報</h4>
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
                <tr>
                    <td class="col-xs-2">
                        総購入金額
                    </td>
                    <td>
                        <%= user.getTotal()%>
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-2">
                        登録日時
                    </td>
                    <td>
                        <%= user.getNewDate()%>
                    </td>
                </tr>
            </table>

            <div class="text-center">
                <a href="MyHistory" class="btn btn-default">購入履歴</a>   
                <a href="MyUpdate" class="btn btn-default">更新</a>   
                <a href="MyDelete" class="btn btn-default">削除</a>
            </div>
            
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
