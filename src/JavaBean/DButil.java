package JavaBean;

import java.sql.*;

public class DButil {
    public static Connection getConn(){
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/library?useUnicode=true&characterEncoding=utf8","root","0907");
        } catch (ClassNotFoundException e) {
            System.out.println("驱动连接异常："+e.getMessage());
        } catch (SQLException e1) {
            System.out.println("拿连接异常："+e1.getMessage());
        }
        return conn;
    }
    public static void release(Statement stmt,Connection conn){
        if (stmt!=null){
            try{
                stmt.close();
            }catch (SQLException e){
                System.out.println("stmt释放异常:"+e.getMessage());
            }
            stmt=null;
        }
        if (conn !=null){
            try{
                conn.close();
            }catch (SQLException e){
                System.out.println("conn释放异常："+e.getMessage());
            }
            conn=null;
        }
    }
    public static void release(PreparedStatement pstmt,Connection conn){
        if (pstmt!=null){
            try{
                pstmt.close();
            }catch (SQLException e){
                System.out.println("pstmt释放异常:"+e.getMessage());
            }
            pstmt=null;
        }
        if (conn !=null){
            try{
                conn.close();
            }catch (SQLException e){
                System.out.println("conn释放异常："+e.getMessage());
            }
            conn=null;
        }
    }
    public static void release(ResultSet rs,Statement stmt, Connection conn){
        if (rs!=null){
            try{
                rs.close();
            }catch (SQLException e){
                System.out.println("rs释放异常"+e.getMessage());
            }
            rs=null;
        }
        release(stmt, conn);
    }
}
