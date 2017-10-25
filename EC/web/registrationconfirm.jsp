<%-- 
    Document   : registrationconfirm
    Created on : 2017/10/04, 13:23:10
    Author     : Ryosuke
--%>

<%@page import="kagoyume.UserData"
        import="kagoyume.KagoyumeHelper"
        import="java.util.ArrayList"%>
<%
    UserData ud = (UserData)session.getAttribute("ud");
    ArrayList<String> chkList = ud.UDchkproperties();
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
            <% if(chkList.size() == 0){ %>
                <h4 class="text-center">会員登録</h4>
                <table class="table table-striped">
                    <tr>
                        <td class="col-xs-2">
                            名前
                        </td>
                        <td>
                            <%= ud.getName()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2">
                            パスワード
                        </td>
                        <td>
                            <%= ud.getPassword()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2">
                            メールアドレス
                        </td>
                        <td>
                            <%= ud.getMail()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2">
                            住所
                        </td>
                        <td>
                            <%= ud.getAddress()%>
                        </td>
                    </tr>
                </table>

                上記の内容で登録します。よろしいですか？

                <form action="RegistrationComplete" method="POST">
                    <input type="submit" name="yes" value="はい" class="btn btn-default col-sm-offset-5 col-sm-2">
                </form>
                <form action="Registration" method="POST">
                    <input type="submit" name="no" value="いいえ" class="btn btn-default col-sm-offset-5 col-sm-2">
                    <input type="hidden" name="mode" value="REINPUT">
                </form>
            <% }else{ %>
                <%=KagoyumeHelper.getInstance().chkinput(chkList) %>
                <form action="Registration" method="POST">
                    <input type="submit" name="no" value="登録画面に戻る" class="btn btn-default col-sm-offset-5 col-sm-2">
                    <input type="hidden" name="mode" value="REINPUT">
                </form>
            <% } %>
        
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
