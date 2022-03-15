package controllers;

import dao.UserDAO;
import entities.Privilege;
import entities.Supervisor;
import entities.User;
import jakarta.ejb.EJB;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import java.io.Serializable;
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
    private Supervisor visor;
    private List<Supervisor> list;
    private Integer pageNumber = 0;
    private String searchText;

    public Supervisor getVisor() {
        if (this.visor == null) {
            return this.visor = new Supervisor();
        }
        return visor;
    }

    public void setVisor(Supervisor visor) {
        this.visor = visor;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }
    
    public Long getUserCount() {
        return this.userDao.userCount();
    }
    
    public Integer getTotalPage() {
        Integer count = getUserCount().intValue();
        
        if(count % 7 == 0)
            return count / 7;
        
        return (count / 7) + 1;
    }

    public String register(Boolean isRegister) {
        userDao.register(visor, isRegister);
        this.visor = new Supervisor();

        return "dashboard?faces-redirect=true";
    }

    public String add() {
        userDao.register(visor, true);
        this.visor = new Supervisor();

        return "list";
    }

    public void findByEmail() {
        setList(userDao.findByEmail(searchText));
    }

    public String login() {
        Supervisor lvisor = userDao.login(visor);
        if (lvisor != null) {
            this.visor = lvisor;
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

    public List<Supervisor> getList() {
        if(searchText == null || searchText.length() == 0)
            return this.userDao.findAll(pageNumber);
        return this.list;
    }

    public void setList(List<Supervisor> list) {
        this.list = list;
    }

    public List<Privilege> getRoleList() {
        return this.userDao.findAllRole();
    }

    public void editUser(Supervisor u) {
        this.visor = u;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

}
