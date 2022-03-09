package controllers;

import dao.UserDAO;
import entities.Privilege;
import entities.User;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author ubeyde
 *
 *
 */
@Named("userBean")
@ViewScoped
public class UsersBean implements Serializable {

    @EJB
    private UserDAO userDao;
    private User user;

    public User getUser() {
        if (this.user == null) {
            return this.user = new User();
        }
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String register(Boolean isRegister) {
        userDao.register(user, isRegister);
        this.user = new User();

        return "dashboard?faces-redirect=true";
    }

    public String login() {
        if (userDao.login(user)) {
            this.user = new User();
            return "dashboard?faces-redirect=true";
        }

        return "signin?faces-redirect=false";
    }

    public String logout() {
        this.userDao.logout();
        return "signin?faces-redirect=true";
    }

    public void deleteUser(User u) {
        if(u != null)
            this.userDao.delete(u);
    }

    public List<User> getList() {
        return this.userDao.findAll();
    }

    public List<Privilege> getRoleList() {
        return this.userDao.findAllRole();
    }

    public void editUser(User u) {
        this.user = u;
    }

}
