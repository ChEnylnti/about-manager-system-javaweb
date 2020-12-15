package Filter;

import JavaBean.User;
import JavaBean.UserDao;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AutoLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse)resp;
        //获得cookie
        Cookie[] cookies =request.getCookies();
        String autologin=null;
        for(int i=0;cookies!=null&&i<cookies.length;i++){
            if ("autologin".equals(cookies[i].getName())){
                autologin =cookies[i].getValue();
                break;
            }
        }
        if(autologin != null){
            String[] parts=autologin.split("-");
            String id=parts[0];
            String inputPw=parts[1];
            User user =new UserDao().checkLogin(id);  //按id查找用户，若不存在说明无此用户
            if(user==null){
                request.getSession().setAttribute("erroi","用户不存在哦");
            }
            if(inputPw.equals(user.getPassword()) ){
                request.setAttribute("id",id);
                HttpSession session=request.getSession();
                session.setAttribute("now",user);  //储存当前登录用户
                //登录成功
            }else {
                HttpSession session=request.getSession();
                session.setAttribute("errop","再想想你的密码");
                request.getRequestDispatcher("/login.jsp").forward(request,response);  //登录失败返回登录页面并输出错误信息
            }
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
