package controllers;

import dao.UserFacade;
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
    private UserFacade tf;
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
        this.tf.register(user, isRegister);
        this.user = new User();

        return "dashboard?faces-redirect=true";
    }

    public String login() {
        if (this.tf.login(user)) {
            this.user = new User();
            return "dashboard?faces-redirect=true";
        }

        return "signin?faces-redirect=false";
    }

    public String logout() {
        this.tf.logout();
        return "signin?faces-redirect=true";
    }

    public void deleteUser(User u) {
        if(u != null)
            this.tf.delete(u);
    }

    public List<User> getList() {
        return this.tf.findAll();
    }

    public void editUser(User u) {
        this.user = u;
    }

}
