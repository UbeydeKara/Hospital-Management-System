package controllers;

import dao.DoctorDAO;
import entities.Privilege;
import entities.Doctor;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author vasim
 *
 *
 */
@Named("doctorBean")
@SessionScoped
public class DoctorBean implements Serializable {

    @EJB
    private DoctorDAO doctorDao;
    private Doctor doctor;
    private List<Doctor> list;
    private Integer pageNumber = 0;
    private Integer pageSize = 8;
    private String searchText;

    public Doctor getDoctor() {
        if (this.doctor == null) {
            return this.doctor = new Doctor();
        }
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }
    
    public Long getUserCount() {
        return this.doctorDao.doctorCount();
    }
    
    public Integer getTotalPage() {
        Integer count = getUserCount().intValue();
        
        if(count == 0)
            return 1;
        
        if(count % 7 == 0)
            return count / 7;
        
        return (count / 7) + 1;
    }

    public String register(Boolean isRegister) {
        doctorDao.register(doctor, isRegister);

        return "doctor/profile?faces-redirect=true";
    }

    public String add() {
        doctorDao.register(doctor, true);
        this.doctor = new Doctor();

        return "dashboard";
    }

    public void findByEmail() {
        setList(doctorDao.findByEmail(searchText));
    }

    public String login() {
        Doctor logged_doc = doctorDao.login(doctor);
        if (logged_doc != null) {
            this.doctor = logged_doc;
            return "doctor/profile?faces-redirect=true";
        }

        return "signin?faces-redirect=false";
    }

    public String logout() {
        this.doctorDao.logout();
        return "/views/signin?faces-redirect=true";
    }

    public void deleteUser(Doctor d) {
        if(d != null)
            this.doctorDao.delete(d);
    }

    public List<Doctor> getList() {
        if(searchText == null || searchText.length() == 0)
            return this.doctorDao.findAll(pageNumber, pageSize);
        return doctorDao.findByName(searchText);
    }

    public void setList(List<Doctor> list) {
        this.list = list;
    }

    public List<Privilege> getRoleList() {
        return this.doctorDao.findAllRole();
    }

    public void updateDoctor() {
        this.doctorDao.updateDoctor(doctor);
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

}
