package JavaBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    public List<Hon> getallHon(){
        List<Hon> all=new ArrayList<>();
        Connection conn=DButil.getConn();
        Statement stmt=null;
        ResultSet rs=null;
        try{
            stmt=conn.createStatement();
            String sql="select * from hon";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                Hon hon=new Hon();
                hon.setCover(rs.getString("cover"));
                hon.setName(rs.getString("name"));
                hon.setAuthor(rs.getString("author"));
                hon.setHeat(rs.getInt("heat"));
                hon.setDate(rs.getDate("date"));
                hon.setPrice(rs.getString("price"));
                hon.setRecommand(rs.getInt("recommand"));
                all.add(hon);
            }
        }catch (SQLException e){
            System.out.println("查询所有异常"+e.getMessage());
        }finally {
            DButil.release(rs,stmt,conn);
        }
        return all;
    }
    public List<Hon> searchByname(String name){
        List<Hon> hons=new ArrayList<>();
        Connection conn=DButil.getConn();
        Statement stmt=null;
        ResultSet rs=null;
        try {
            stmt=conn.createStatement();
            String sql="select * from hon where name like'%"+name+"%'";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                Hon hon=new Hon();
                hon.setCover(rs.getString("cover"));
                hon.setName(rs.getString("name"));
                hon.setAuthor(rs.getString("author"));
                hon.setHeat(rs.getInt("heat"));
                hon.setDate(rs.getDate("date"));
                hon.setPrice(rs.getString("price"));
                hon.setRecommand(rs.getInt("recommand"));
                hons.add(hon);
            }
        }catch (SQLException e){
            System.out.println("按书名查询异常："+e.getMessage());
        }finally {
            DButil.release(rs,stmt,conn);
        }
        return hons;
    }
    public List<Hon> searchByauthor(String author){
        List<Hon> hons=new ArrayList<>();
        Connection conn=DButil.getConn();
        Statement stmt=null;
        ResultSet rs=null;
        try {
            stmt=conn.createStatement();
            String sql="select * from hon where author like'%"+author+"%'";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                Hon hon=new Hon();
                hon.setCover(rs.getString("cover"));
                hon.setName(rs.getString("name"));
                hon.setAuthor(rs.getString("author"));
                hon.setHeat(rs.getInt("heat"));
                hon.setDate(rs.getDate("date"));
                hon.setPrice(rs.getString("price"));
                hon.setRecommand(rs.getInt("recommand"));
                hons.add(hon);
            }
        }catch (SQLException e){
            System.out.println("按作者查询异常："+e.getMessage());
        }finally {
            DButil.release(rs,stmt,conn);
        }
        return hons;
    }
    public List<Hon> searchprice(String year){
        List<Hon> hons=new ArrayList<>();
        Connection conn=DButil.getConn();
        Statement stmt=null;
        ResultSet rs=null;
        try {
            stmt=conn.createStatement();
            String sql="select * from hon where price like'%"+year+"%'";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                Hon hon=new Hon();
                hon.setCover(rs.getString("cover"));
                hon.setName(rs.getString("name"));
                hon.setAuthor(rs.getString("author"));
                hon.setHeat(rs.getInt("heat"));
                hon.setDate(rs.getDate("date"));
                hon.setPrice(rs.getString("price"));
                hon.setRecommand(rs.getInt("recommand"));
                hons.add(hon);
            }
        }catch (SQLException e){
            System.out.println("获奖查询异常："+e.getMessage());
        }finally {
            DButil.release(rs,stmt,conn);
        }
        return hons;
    }
    public List<Hon> orderByhot(){
        List<Hon> hons=new ArrayList<>();
        Connection conn=DButil.getConn();
        Statement stmt=null;
        ResultSet rs=null;
        try {
            stmt=conn.createStatement();
            String sql="SELECT * FROM hon ORDER BY heat DESC LIMIT 10;" ;
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                Hon hon=new Hon();
                hon.setCover(rs.getString("cover"));
                hon.setName(rs.getString("name"));
                hon.setAuthor(rs.getString("author"));
                hon.setHeat(rs.getInt("heat"));
                hon.setDate(rs.getDate("date"));
                hon.setPrice(rs.getString("price"));
                hon.setRecommand(rs.getInt("recommand"));
                hons.add(hon);
            }
        }catch (SQLException e){
            System.out.println("按热度排序异常："+e.getMessage());
        }finally {
            DButil.release(rs,stmt,conn);
        }
        return hons;
    }
    public List<Hon> orderBydate(){
        List<Hon> hons=new ArrayList<>();
        Connection conn=DButil.getConn();
        Statement stmt=null;
        ResultSet rs=null;
        try {
            stmt=conn.createStatement();
            String sql="SELECT * FROM hon ORDER BY DATE DESC;";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                Hon hon=new Hon();
                hon.setCover(rs.getString("cover"));
                hon.setName(rs.getString("name"));
                hon.setAuthor(rs.getString("author"));
                hon.setHeat(rs.getInt("heat"));
                hon.setDate(rs.getDate("date"));
                hon.setPrice(rs.getString("price"));
                hon.setRecommand(rs.getInt("recommand"));
                hons.add(hon);
            }
        }catch (SQLException e){
            System.out.println("按日期排序异常："+e.getMessage());
        }finally {
            DButil.release(rs,stmt,conn);
        }
        return hons;
    }
    public List<Hon> orderByrecommand(){
        List<Hon> hons=new ArrayList<>();
        Connection conn=DButil.getConn();
        Statement stmt=null;
        ResultSet rs=null;
        try {
            stmt=conn.createStatement();
            String sql="SELECT * FROM hon ORDER BY recommand DESC;";
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                Hon hon=new Hon();
                hon.setCover(rs.getString("cover"));
                hon.setName(rs.getString("name"));
                hon.setAuthor(rs.getString("author"));
                hon.setHeat(rs.getInt("heat"));
                hon.setDate(rs.getDate("date"));
                hon.setPrice(rs.getString("price"));
                hon.setRecommand(rs.getInt("recommand"));
                hons.add(hon);
            }
        }catch (SQLException e){
            System.out.println("按推荐排序异常："+e.getMessage());
        }finally {
            DButil.release(rs,stmt,conn);
        }
        return hons;
    }
    public void torecommand(String name){
        Connection conn=DButil.getConn();
        PreparedStatement pstmt=null;
        try{
            String sql="UPDATE hon SET recommand=recommand+1 WHERE NAME = ?;";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,name);
            pstmt.executeUpdate();
        }catch (SQLException e){
            System.out.println("推荐异常："+e.getMessage());
        }finally {
            DButil.release(pstmt,conn);
        }
    }
    public void add(Hon hon){
        Connection conn=DButil.getConn();
        PreparedStatement pstmt=null;
        try{
            String sql="INSERT INTO hon (cover,NAME,author,heat,DATE,price)VALUES(?,?,?,?,?,?);";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,hon.getCover());
            pstmt.setString(2,hon.getName());
            pstmt.setString(3,hon.getAuthor());
            pstmt.setInt(4,hon.getHeat());
            pstmt.setDate(5,new java.sql.Date(hon.getDate().getTime()));
            pstmt.setString(6,hon.getPrice());
            pstmt.executeUpdate();
        }catch (SQLException e){
            System.out.println("添加书本异常"+e.getMessage());
        }finally {
            DButil.release(pstmt,conn);
        }
    }
    public void del(String name){
        Connection conn=DButil.getConn();
        PreparedStatement pstmt=null;
        try{
            String sql="delete from hon where name=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,name);
            pstmt.executeUpdate();
        }catch (SQLException e){
            System.out.println("删除异常："+e.getMessage());
        }finally {
            DButil.release(pstmt,conn);
        }
    }
    public void update(Hon hon){
        Connection conn=DButil.getConn();
        PreparedStatement pstmt=null;
        try{
            String sql="update hon set cover=?,author=?,heat=?,date=?,price=? where name =?;";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,hon.getCover());
            pstmt.setString(2,hon.getAuthor());
            pstmt.setInt(3,hon.getHeat());
            pstmt.setDate(4,new java.sql.Date(hon.getDate().getTime()));
            pstmt.setString(5,hon.getPrice());
            pstmt.setString(6,hon.getName());
            pstmt.executeUpdate();
        }catch (SQLException e){
            System.out.println("更新书本异常"+e.getMessage());
        }finally {
            DButil.release(pstmt,conn);
        }
    }
}
