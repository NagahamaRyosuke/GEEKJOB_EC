/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.util.ArrayList;

/**
 *
 * @author Ryosuke
 */
public class KagoyumeHelper {
    
    //トップへのリンクを設定
    private final String homeURL = "top.jsp";
    
    public static KagoyumeHelper getInstance(){
        return new KagoyumeHelper();
    }
    
    //トップへのリンクを返却
    public String home(){
        return "<h4 class=\"bg-success text-center\"><a href=\""+homeURL+"\">トップへ戻る</a></h4>";
    }
    
    public String chkinput(ArrayList<String> chkList){
        String output = "<h4 class=\"text-center text-danger\">";
        for(String val : chkList){
            if(val.equals("name")){
                output += "名前";
            }
            if(val.equals("password")){
                output += "パスワード";
            }
            if(val.equals("mail")){
                output += "メールアドレス";
            }
            if(val.equals("address")){
                output += "住所";
            }
            output += "が未記入です。<br>";
        }
        output += "</h4>";
        return output;
    }
    
    public String login(UserDataDTO udd){
        String log;
        if(udd == null){
            log = "<div class=\"pull-right h4\"><a href=\"Login\">ログイン</a></div>";
        }else{
           log = "<div class=\"pull-right h4\"><a href=\"Login\">ログアウト</a><br>";
           log += "<a href=\"Cart\">買い物かご</a><br>";
           log += "ようこそ<a href=\"MyData\">"+udd.getName()+"</a>さん</div>";
        } 
        return log;
    }
}
