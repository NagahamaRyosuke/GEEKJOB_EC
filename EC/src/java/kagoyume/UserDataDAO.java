/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import base.DBmanager;
import com.fasterxml.jackson.databind.JsonNode;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Ryosuke
 */
public class UserDataDAO {
    
    public static UserDataDAO getInstance(){
        return new UserDataDAO();
    }
    
    //登録処理
    public void insert(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBmanager.getConnection();
            st = con.prepareStatement("INSERT INTO user_t(name, password, mail, address, newDate) VALUES(?,?,?,?,?)");
            st.setString(1, ud.getName());
            st.setString(2, ud.getPassword());
            st.setString(3, ud.getMail());
            st.setString(4, ud.getAddress());
            st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            st.executeUpdate();
            
            System.out.println("insert completed");
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }
        }
    }
    
    //ログイン処理 ユーザーIDを返却
    public int login(String name, String password) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        String user_name = "";
        String user_pass = "";
        int id = 0;
        try{
            con = DBmanager.getConnection();

            st = con.prepareStatement("SELECT * FROM user_t WHERE name=? and password=?");
            st.setString(1, name);
            st.setString(2, password);
            
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                user_name = rs.getString("name");
                user_pass = rs.getString("password");
            }

            //ユーザー名とパスワードの比較
            if(name.equals(user_name) && password.equals(user_pass)){
                id = rs.getInt("userID");
            }
            
            rs.close();
            st.close();
            return id;
        } catch(SQLException e){
            System.out.println("SQLException:"+e.getMessage());
            throw new SQLException(e);
        } finally {
            if(con != null){
                con.close(); 
            }
        }
    }
    
    //IDから会員情報を取得
    public UserDataDTO searchByID(int id) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBmanager.getConnection();
            st =  con.prepareStatement("SELECT * FROM user_t WHERE userID = ?");
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            rs.next();
            UserDataDTO resultUd = new UserDataDTO();
            resultUd.setUserID(rs.getInt(1));
            resultUd.setName(rs.getString(2));
            resultUd.setPassword(rs.getString(3));
            resultUd.setMail(rs.getString(4));
            resultUd.setAddress(rs.getString(5));
            resultUd.setTotal(rs.getInt(6));
            resultUd.setNewDate(rs.getDate(7));
            resultUd.setDeleteFlg(rs.getInt(8));
            
            System.out.println("searchByID completed");

            rs.close();
            st.close();
            return resultUd;
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }     
        }    
    }
    
    //更新
    public void update(UserDataDTO udd) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBmanager.getConnection();

            st = con.prepareStatement("UPDATE user_t SET name=?, password=?, mail=?, address=?, newDate=? WHERE userID=?");
            st.setString(1, udd.getName());
            st.setString(2, udd.getPassword());
            st.setString(3, udd.getMail());
            st.setString(4, udd.getAddress());
            st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            st.setInt(6, udd.getUserID());
            st.executeUpdate();

            System.out.println("update completed");
            st.close();
        } catch(SQLException e){
            System.out.println("SQLException:"+e.getMessage());
        } catch(Exception e){
            System.out.println("Exception:"+e.getMessage());
        } finally {
            if(con != null){
                con.close(); 
            }
        }
    } 
    
    //削除（削除フラグを1にする）
    public void delete(UserDataDTO udd) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            con = DBmanager.getConnection();

            st = con.prepareStatement("UPDATE user_t SET deleteflg=? WHERE userID=?");
            st.setInt(1, 1);
            st.setInt(2, udd.getUserID());
            st.executeUpdate();
            System.out.println("delete completed");
            st.close();
        } catch(SQLException e){
            System.out.println("SQLException:"+e.getMessage());
        } catch(Exception e){
            System.out.println("Exception:"+e.getMessage());
        } finally {
            if(con != null){
                con.close(); 
            }
        }
    }
    
    //購入処理
    public void buy(ArrayList<JsonNode> cart, UserDataDTO ud, String type) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            int total = 0;
            con = DBmanager.getConnection();
            
            //buy_tに書き込み
            for(JsonNode node: cart){
                total += node.get("Price").get("_value").asInt();
                st = con.prepareStatement("INSERT INTO buy_t(userID, itemCode, type, buyDate) VALUES(?,?,?,?)");
                st.setInt(1, ud.getUserID());
                st.setString(2, node.get("Code").asText());
                st.setInt(3, Integer.parseInt(type));
                st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                st.executeUpdate();
            }
            
            //総購入金額を読み込む
            st =  con.prepareStatement("SELECT total FROM user_t WHERE userID = ?");
            st.setInt(1, ud.getUserID());
            
            ResultSet rs = st.executeQuery();
            rs.next();
            total += rs.getInt("total");

            //総購入金額を書き込む
            st = con.prepareStatement("UPDATE user_t SET total=? WHERE userID=?");
            st.setInt(1, total);
            st.setInt(2, ud.getUserID());
            st.executeUpdate();
            
            System.out.println("buy completed");
            st.close();
            rs.close();
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }
        }
    }
    
    //IDから購入履歴を取得
    public ArrayList<UserDataDTO> buyHistory(UserDataDTO ud) throws SQLException{
        Connection con = null;
        PreparedStatement st = null;
        try{
            ArrayList<UserDataDTO> buyList = new ArrayList<>();
            con = DBmanager.getConnection();
            
            st =  con.prepareStatement("SELECT * FROM buy_t WHERE userID = ?");
            st.setInt(1, ud.getUserID());
            
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                UserDataDTO resultUd = new UserDataDTO();
                resultUd.setType(rs.getInt("type"));
                resultUd.setItemCode(rs.getString("itemCode"));
                resultUd.setBuyDate(rs.getDate("buyDate"));
                buyList.add(resultUd);
            }
            
            System.out.println("buyhistory completed");

            rs.close();
            st.close();
            return buyList;
        }catch(SQLException e){
            System.out.println(e.getMessage());
            throw new SQLException(e);
        }finally{
            if(con != null){
                con.close();
            }     
        }    
    }    
        
}
