package util;

import entities.User;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(filterName = "AuthFilter", urlPatterns = {"*.xhtml"})
public class AuthorizationFilter implements Filter {

    public AuthorizationFilter() {
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        String loginURL = request.getContextPath() + "/views/signin.xhtml"; 
        String registerURL = request.getContextPath() + "/views/signup.xhtml"; 
        String dashboardURL = request.getContextPath() + "/views/dashboard.xhtml"; 

        if (user == null && request.getRequestURI().equals(dashboardURL)) {       
            response.sendRedirect(loginURL);
        }
        else if(user != null && (request.getRequestURI().equals(loginURL) || request.getRequestURI().equals(registerURL))) {  
            response.sendRedirect(dashboardURL);
        }
        else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
