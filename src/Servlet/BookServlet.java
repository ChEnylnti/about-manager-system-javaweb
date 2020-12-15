package Servlet;

import JavaBean.BookDao;
import JavaBean.Hon;
import JavaBean.User;
import JavaBean.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
    private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dowhat=request.getParameter("dowhat");
        if ("search".equals(dowhat)){
            String by=request.getParameter("by");
            if ("1".equals(by)){
                String name=request.getParameter("search");
                List<Hon> hons=new BookDao().searchByname(name);
                request.setAttribute("all",hons);
                request.getRequestDispatcher("/result.jsp").forward(request,response);
            }else {
                String author=request.getParameter("search");
                List<Hon> hons=new BookDao().searchByauthor(author);
                request.setAttribute("all",hons);
                request.getRequestDispatcher("/result.jsp").forward(request,response);
            }
        }
        if ("add".equals(dowhat)){
            int heat=0;
            String cover =request.getParameter("cover");
            if (cover==""){
                cover="img\\default.png";
            }
            String name=request.getParameter("name");
            String author=request.getParameter("author");
            if (request.getParameter("heat")!=""){
                heat=Integer.parseInt(request.getParameter("heat"));
            }
            String date1=request.getParameter("date");
            String price=request.getParameter("price");
            Hon hon=new Hon();
            hon.setCover(cover);
            hon.setName(name);
            hon.setAuthor(author);
            hon.setHeat(heat);
            try {
                hon.setDate(sdf.parse(date1));
            }catch (ParseException e){
                System.out.println("日期转换出错："+e.getMessage());
            }
            hon.setPrice(price);
            new BookDao().add(hon);
            response.sendRedirect(request.getContextPath()+"/BookServlet?dowhat=getall");
        }
        if ("update".equals(dowhat)){
            int heat=0;
            String cover =request.getParameter("cover");
            if (cover==""){
                cover=null;
            }
            String name=request.getParameter("name");
            String author=request.getParameter("author");
            if (request.getParameter("heat")!=""){
                heat=Integer.parseInt(request.getParameter("heat"));
            }
            String date1=request.getParameter("date");
            String price=request.getParameter("price");
            Hon hon=new Hon();
            hon.setCover(cover);
            hon.setName(name);
            hon.setAuthor(author);
            hon.setHeat(heat);
            try {
                hon.setDate(sdf.parse(date1));
            }catch (ParseException e){
                System.out.println("日期转换出错："+e.getMessage());
            }
            hon.setPrice(price);
            new BookDao().update(hon);
            response.sendRedirect(request.getContextPath()+"/BookServlet?dowhat=getall");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dowhat=request.getParameter("dowhat");
        if ("getall".equals(dowhat)){
            List<Hon> all=new BookDao().getallHon();
            request.setAttribute("all",all);
            request.getRequestDispatcher("/result.jsp").forward(request,response);
        }
        if("searchhot".equals(dowhat)){
            List<Hon> all=new BookDao().orderByhot();
            request.setAttribute("all",all);
            request.getRequestDispatcher("/result.jsp").forward(request,response);
        }
        if("searchdate".equals(dowhat)){
            List<Hon> all=new BookDao().orderBydate();
            request.setAttribute("all",all);
            request.getRequestDispatcher("/result.jsp").forward(request,response);
        }
        if("searchprice".equals(dowhat)){
            String year=request.getParameter("year");
            request.getSession().setAttribute("year",year);
            List<Hon> all=new BookDao().searchprice(year);
            request.setAttribute("all",all);
            request.getRequestDispatcher("/price.jsp").forward(request,response);
        }
        if ("recommand".equals(dowhat)){
            String name=request.getParameter("name");
            new BookDao().torecommand(name);
            HttpSession session=request.getSession();
            session.setAttribute("tipre","推荐成功，会有更多人看到这本书");
            request.getRequestDispatcher("/controller.jsp").forward(request,response);
        }
        if ("del".equals(dowhat)){
            User now=(User) request.getSession().getAttribute("now");
            if ("1".equals(now.getPower())){
                String name=request.getParameter("name");
                new BookDao().del(name);
                response.sendRedirect(request.getContextPath()+"/BookServlet?dowhat=getall");
            }else {
                request.getSession().setAttribute("tipre","权限不够");
                request.getRequestDispatcher("/controller.jsp").forward(request,response);
            }

        }
        if("update".equals(dowhat)){
            User now=(User) request.getSession().getAttribute("now");
            System.out.println(now.getPower());
            if ("1".equals(now.getPower())){
                String name=request.getParameter("name");
                Hon hon=(new BookDao().searchByname(name)).get(0);
                request.getSession().setAttribute("all",hon);
                response.sendRedirect(request.getContextPath()+"/update.jsp");
            }else {
                request.getSession().setAttribute("tipre","权限不够");
                request.getRequestDispatcher("/controller.jsp").forward(request,response);
            }

        }
}
}