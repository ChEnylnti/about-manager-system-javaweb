package Servlet;

import JavaBean.BookDao;
import JavaBean.Hon;
import JavaBean.User;
import JavaBean.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String dowhat=request.getParameter("dowhat");
      if("logon".equals(dowhat)){  //注册
          String id=request.getParameter("id");
          String password=request.getParameter("password");
          User user=new User();
          user.setId(id);
          user.setPassword(password);
          Boolean exist =new UserDao().logon(user);
          if(exist==false){
              response.sendRedirect(request.getContextPath()+"/login.jsp");
          }else{
              HttpSession session=request.getSession();
              session.setAttribute("erro","用户名已经存在了哦");
              response.sendRedirect(request.getContextPath()+"/logon.jsp");
          }

      }
      if("login".equals(dowhat)){  //登录
          String autologin =request.getParameter("autologin");
          String id =request.getParameter("id");
          User user =new UserDao().checkLogin(id);  //按id查找用户，若不存在说明无此用户
          if(user==null){
              request.getSession().setAttribute("erroi","用户不存在哦");
              request.getRequestDispatcher("/login.jsp").forward(request,response);
          }
          String inputPw=request.getParameter("password");  //存在则验证密码
          if(inputPw.equals(user.getPassword()) ){
              request.setAttribute("id",id);
              HttpSession session=request.getSession();
              session.setAttribute("now",user);  //储存当前登录用户
              if(autologin !=null){
                  Cookie cookie =new Cookie("autologin",id + "-" +inputPw);
                  cookie.setMaxAge(Integer.parseInt(autologin));
                  cookie.setPath(request.getContextPath());
                  response.addCookie(cookie);
              }

              request.getRequestDispatcher("/controller.jsp").forward(request,response);  //登录成功
          }else {
              HttpSession session=request.getSession();
              session.setAttribute("errop","再想想你的密码");
              request.getRequestDispatcher("/login.jsp").forward(request,response);  //登录失败返回登录页面并输出错误信息
          }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dowhat=request.getParameter("dowhat");
        if ("logout".equals(dowhat)){
            request.getSession().removeAttribute("now");
            Cookie cookie =new Cookie("autologin","null");
            cookie.setMaxAge(0);
            cookie.setPath(request.getContextPath());
            response.addCookie(cookie);
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }
}
