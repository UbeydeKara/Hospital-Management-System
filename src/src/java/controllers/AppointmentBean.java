package controllers;

import dao.AppointmentDAO;
import entities.Appointment;
import entities.Clinic;
import entities.Doctor;
import entities.Patient;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author nur
 *
 *
 */
@Named("appointmentBean")
@SessionScoped
public class AppointmentBean implements Serializable {

    @EJB
    private AppointmentDAO appointmentDao;
    private Appointment appointment;
    private List<Appointment> list;
    private Integer pageNumber = 0;
    private Integer pageSize = 8;
    private String searchText;

    public Appointment getAppointment() {
        if (this.appointment == null) {
            Appointment a = new Appointment();
            a.setClinic(new Clinic());
            a.setDoctor(new Doctor());
            a.setPatient(new Patient());
            return a;
        }
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }
    
    public Long getAppointmentCount() {
        return this.appointmentDao.appointmentCount();
    }
    
    public Integer getTotalPage() {
        Integer count = getAppointmentCount().intValue();
        
        if(count == 0)
            return 1;
        
        if(count % 7 == 0)
            return count / 7;
        
        return (count / 7) + 1;
    }

    public void deleteAppointment (Appointment d) {
        if(d != null)
            this.appointmentDao.delete(d);
    }

    public List<Appointment> getList() {
        if(searchText == null || searchText.length() == 0)
            return this.appointmentDao.findAll(pageNumber, pageSize);
        return appointmentDao.findByName(searchText);
    }

    public void setList(List<Appointment> list) {
        this.list = list;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

}
