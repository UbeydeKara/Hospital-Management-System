package controllers;

import dao.AppointmentDAO;
import entities.Appointment;
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
            return this.appointment = new Appointment();
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

    public Long getAppointmentCount(Patient patient) {
        return this.appointmentDao.appointmentCount(patient);
    }

    public Integer getTotalPage(Patient patient) {
        Integer count = getAppointmentCount(patient).intValue();

        if (count == 0) {
            return 1;
        }

        if (count % 7 == 0) {
            return count / 7;
        }

        return (count / 7) + 1;
    }

    public void deleteAppointment() {
        if (appointment != null) {
            this.appointmentDao.delete(appointment);
        }
    }

    public List<Appointment> getList(Patient patient) {
        if (searchText == null || searchText.length() == 0) {
            return this.appointmentDao.findAll(pageNumber, pageSize, patient);
        }
        return appointmentDao.findByDoctor(searchText, patient);
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

    public void add(Patient patient) {
        appointment.setPatient(patient);
        appointmentDao.update(appointment);
    }

    public void updateAppointment() {
        this.appointmentDao.update(appointment);
    }

}
