package controllers;

import dao.PatientDAO;
import dao.UserDAO;
import entities.Privilege;
import entities.Patient;
import entities.User;
import jakarta.ejb.EJB;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author vasim
 *
 *
 */
@Named("patientBean")
@ViewScoped
public class PatientBean implements Serializable {

    @EJB
    private PatientDAO patientDao;
    private Patient patient;
    private List<Patient> list;
    private Integer pageNumber = 0;
    private String searchText;

    public Patient getPatient() {
        if (this.patient == null) {
            return this.patient = new Patient();
        }
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }
    
    public Long getUserCount() {
        return this.patientDao.patientCount();
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
        patientDao.register(patient, isRegister);
        this.patient = new Patient();

        return "patient/profile?faces-redirect=true";
    }

    public String add() {
        patientDao.register(patient, true);
        this.patient = new Patient();

        return "list";
    }

    public void findByEmail() {
        setList(patientDao.findByEmail(searchText));
    }

    public String login() {
        Patient lpatient = patientDao.login(patient);
        if (lpatient != null) {
            this.patient = lpatient;
            String xx = patient.getEmail();
            return "patient/profile?faces-redirect=true";
        }

        return "signin?faces-redirect=false";
    }

    public String logout() {
        this.patientDao.logout();
        return "/views/signin?faces-redirect=true";
    }

    public void deleteUser(Patient d) {
        if(d != null)
            this.patientDao.delete(d);
    }

    public List<Patient> getList() {
        if(searchText == null || searchText.length() == 0)
            return this.patientDao.findAll(pageNumber);
        return this.list;
    }

    public void setList(List<Patient> list) {
        this.list = list;
    }

    public List<Privilege> getRoleList() {
        return this.patientDao.findAllRole();
    }

    public void updatePatient() {
        this.patientDao.updatePatient(patient);
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

}
