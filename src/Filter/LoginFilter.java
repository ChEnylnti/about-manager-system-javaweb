package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class LoginFilter implements Filter {
    //实例化一个静态集合
    private  static List<String> urls=new ArrayList<>();
    //静态代码块中向集合存放所有可以放行的请求或网页地址
    static {
        urls.add("/login.jsp");
        urls.add("/css");
        urls.add("/js");
        urls.add("/img");
        urls.add("/fonts");
        urls.add("/logon.jsp");
        urls.add("/index.jsp");
        urls.add("/UserServlet");
    }
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse)resp;
        //得到当前页面所在目录下全名称
        String urlPattern=request.getServletPath();
        //当前页面所在服务器的绝对路径
        String path=request.getRequestURI();
        for(String url:urls){
            if (url.equals(urlPattern) || path.contains(url)){
                chain.doFilter(req,resp);
                //防止重复响应
                return;
            }
        }
        //如果now为null，表示未登录
        if(request.getSession().getAttribute("now")==null){
            System.out.println("这未登录？");
            response.sendRedirect("login.jsp");
        }else{
            //通过
            chain.doFilter(req,resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
