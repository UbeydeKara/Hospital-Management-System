package controllers;

import dao.PrescriptionDAO;
import entities.Patient;
import entities.Prescription;
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
@Named("prescriptionBean")
@SessionScoped
public class PrescriptionBean implements Serializable {

    @EJB
    private PrescriptionDAO prescriptionDao;
    private Prescription prescription;
    private List<Prescription> list;
    private Integer pageNumber = 0;
    private Integer pageSize = 8;
    private String searchText;

    public Prescription getPrescription() {
        if (this.prescription == null) {
            return this.prescription = new Prescription();
        }
        return prescription;
    }

    public void setPrescription(Prescription prescription) {
        this.prescription = prescription;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }
    
    public Long getPrescriptionCount(Patient patient) {
        return this.prescriptionDao.prescriptionCount(patient);
    }
    
    public Integer getTotalPage(Patient patient) {
        Integer count = getPrescriptionCount(patient).intValue();
        
        if(count == 0)
            return 1;
        
        if(count % 7 == 0)
            return count / 7;
        
        return (count / 7) + 1;
    }


    public List<Prescription> getList(Patient patient) {
        if(searchText == null || searchText.length() == 0)
            return this.prescriptionDao.findAll(pageNumber, pageSize, patient);
        return prescriptionDao.findByDoctor(searchText, patient);
    }

    public void setList(List<Prescription> list) {
        this.list = list;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

}
