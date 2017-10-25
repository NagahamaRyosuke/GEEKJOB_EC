<%-- 
    Document   : myhistory
    Created on : 2017/10/04, 13:48:04
    Author     : Ryosuke
--%>

<%@page import="kagoyume.UserDataDTO"
        import="java.util.ArrayList"
        import="kagoyume.KagoyumeHelper"%>
<%
    ArrayList<UserDataDTO> buyList = (ArrayList<UserDataDTO>)request.getAttribute("buyList");
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
        <h4>購入履歴</h4>
        
        <% if(request.getAttribute("empty") == null){ %>
            <% for(UserDataDTO ud: buyList){ %>
                <table class="table">
                    <tr>
                        <td class="col-xs-2 active">
                            商品コード
                        </td>
                        <td>
                            <%=ud.getItemCode()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2 active">
                            発送方法
                        </td>
                        <td>
                            <% if(ud.getType() == 1){ %>
                                ヤマト
                            <% }
                            if(ud.getType() == 2){ %>
                                佐川
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2 active">
                            購入日時
                        </td>
                        <td>
                            <%=ud.getBuyDate()%>
                        </td>
                    </tr>
                </table>
            <% } %>      
        <% }else{ %>
            <h4 class="text-center">購入履歴はありません</h4>
        <% } %>
        
        </div>
        <%=KagoyumeHelper.getInstance().home()%>
    </body>
</html>
