/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package base;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

/**
 *
 * @author Ryosuke
 */
//http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch?appid=dj00aiZpPVhoT2ZSaVEwMEV0UyZzPWNvbnN1bWVyc2VjcmV0Jng9NmQ-&query=
//https://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemLookup?appid=dj00aiZpPVhoT2ZSaVEwMEV0UyZzPWNvbnN1bWVyc2VjcmV0Jng9NmQ-&responsegroup=medium&itemcode=
public class APImanager {
    
    final static String APP_ID = "dj00aiZpPVhoT2ZSaVEwMEV0UyZzPWNvbnN1bWVyc2VjcmV0Jng9NmQ-";
    
    //商品検索
    public static JsonNode itemSearch(String query){
        String BASE_URI = "http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch";
        URL url;
        JsonNode node = null;
        try {
            url = new URL(BASE_URI+"?appid="+APP_ID+"&query="+query);
            node = getJson(url);
        } catch (MalformedURLException ex) {
            System.out.println("MalformedURLException:"+ex.getMessage());
        }  
        return node;
    }
    
    //商品コード検索
    public static JsonNode itemLookup(String code){
        String BASE_URI = "https://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemLookup";
        URL url;
        JsonNode node = null;
        try {
            url = new URL(BASE_URI+"?appid="+APP_ID+"&responsegroup=medium&itemcode="+code);
            node = getJson(url);
        } catch (MalformedURLException ex) {
            System.out.println("MalformedURLException:"+ex.getMessage());
        } 
        return node;
    }
    
    //URLからJosnNodeを返す
    public static JsonNode getJson(URL url){
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = null;
        try {
            //URLに接続
            HttpURLConnection urlconn = (HttpURLConnection)url.openConnection();
            urlconn.setRequestMethod("GET");
            urlconn.setInstanceFollowRedirects(false);
            urlconn.connect();

            //ストリームを受け取る
            BufferedReader reader = new BufferedReader(new InputStreamReader(urlconn.getInputStream()));
            StringBuilder responseBuffer = new StringBuilder();
            
            String line = "";
            while (line != null){
                line = reader.readLine();
                responseBuffer.append(line);
            }

            reader.close();
            urlconn.disconnect();
        
            String response = responseBuffer.toString(); 
            rootNode = mapper.readTree(response);

        } catch (ProtocolException ex) {
             System.out.println("ProtocolException:"+ex.getMessage());
        } catch (IOException ex) {
            System.out.println("IOException:"+ex.getMessage());
        }
        return rootNode;
    }
}
