package controllers;

import dao.UserDAO;
import entities.Privilege;
import entities.Supervisor;
import entities.User;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.enterprise.context.SessionScoped;
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
@SessionScoped
public class UsersBean implements Serializable {

    @EJB
    private UserDAO userDao;
    private Supervisor visor;
    private Integer pageNumber = 0;
    private Integer pageSize = 8;
    private String searchText;
    private Integer currentPage = 0;

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
        if(pageNumber >= 0 && pageNumber < getTotalPage())
            this.pageNumber = pageNumber;
    }
    
    public Long getUserCount() {
        if(searchText == null || searchText.length() == 0)
            return this.userDao.userCount();
        return Long.valueOf(userDao.findByName(searchText).size());
    }
    
    public Integer getTotalPage() {
        Integer count = getUserCount().intValue();
        
        if(count == 0)
            return 1;
        
        if(count % pageSize == 0)
            return count / pageSize;
        
        return (count / pageSize) + 1;
    }

    public String register(Boolean isRegister) {
        userDao.register(visor, isRegister);
        this.visor = new Supervisor();

        return "signin";
    }

    public String add() {
        userDao.register(visor, true);
        this.visor = new Supervisor();

        return "dashboard";
    }

    public String login() {
        Supervisor lvisor = userDao.login(visor);
        if (lvisor != null) {
            this.visor = lvisor;
            return "supervisor/dashboard?faces-redirect=true";
        }

        return "/views/signin?faces-redirect=false";
    }

    public String logout() {
        this.userDao.logout();
        return "/views/signin?faces-redirect=true";
    }

    public void deleteUser(User u) {
        if(u != null)
            this.userDao.delete(u);
    }
    
    public void updateStatus(Supervisor entity) {
        entity.setIs_confirmed(!entity.getIs_confirmed());
        this.userDao.updateVisor(entity);
    }

    public List<Supervisor> getList() {
        if(searchText == null || searchText.length() == 0)
            return this.userDao.findAll(pageNumber, pageSize);
        return userDao.findByName(searchText);
    }

    public List<Privilege> getRoleList() {
        return this.userDao.findAllRole();
    }

    public void updateUser(Supervisor u) {
        this.userDao.updateVisor(u);
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }
    
    

}
