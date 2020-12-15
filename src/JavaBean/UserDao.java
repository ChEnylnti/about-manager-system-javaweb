package JavaBean;

import java.sql.*;

public class UserDao {
    public Boolean logon(User user){
        Boolean exist=true;
        Connection conn=DButil.getConn();
        PreparedStatement pstmt=null;
        try{
            User user1=checkLogin(user.getId());
            if (user.getId()!=user1.getId()){
            String sql="INSERT  INTO `user`(`id`,`password`) VALUES (?,?);";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,user.getId());
            pstmt.setString(2,user.getPassword());
            pstmt.executeUpdate();
            exist=false;
            }
        }catch (SQLException e){
            System.out.println("添加账户异常："+e.getMessage());
        }finally {
            DButil.release(pstmt,conn);
        }
        return exist;
    }
    //检验账号密码是否正确，按账号找对象
    public User checkLogin(String id){
        Connection conn =DButil.getConn();
        Statement stmt =null;
        ResultSet rs=null;
        User user=null;
        String sql="select * from user where id='" +id+ "'";
        try{
            stmt =conn.createStatement();
            rs=stmt.executeQuery(sql);
        if(rs.next()){
            user=new User();
            user.setId(rs.getString("id"));
            user.setPassword(rs.getString("password"));
            user.setPower(rs.getString("power"));
        }
        }catch(SQLException e){
            System.out.println("根据id找账户异常："+e.getMessage());
        }finally {
            DButil.release(rs,stmt,conn);
        }
        return user;
    }
}
