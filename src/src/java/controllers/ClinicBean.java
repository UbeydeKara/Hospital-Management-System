package controllers;

import dao.CityDAO;
import dao.ClinicDAO;
import dao.PatientDAO;
import entities.City;
import entities.Clinic;
import entities.Privilege;
import entities.Patient;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author ubeyde
 *
 *
 */
@Named("clinicBean")
@SessionScoped
public class ClinicBean implements Serializable {

    @EJB
    private ClinicDAO clinicDao;
    private Clinic selectedClinic;
    private Integer pageNumber = 0;
    private Integer pageSize = 8;
    private String searchText;

    public Clinic getSelectedClinic() {
        if (this.selectedClinic == null) {
            return this.selectedClinic = new Clinic();
        }
        return selectedClinic;
    }

    public void setSelectedClinic(Clinic selectedClinic) {
        this.selectedClinic = selectedClinic;
    }

    public List<Clinic> getList() {
        if(searchText == null || searchText.length() == 0)
            return this.clinicDao.findAll(pageNumber, pageSize);
        return clinicDao.findByName(searchText);
    }
    
    public Long clinicCount() {
        if(searchText == null || searchText.length() == 0)
            return this.clinicDao.clinicCount();
        return Long.valueOf(clinicDao.findByName(searchText).size());
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }
    
    public Integer getTotalPage() {
        Integer count = clinicCount().intValue();
        
        if(count == 0)
            return 1;
        
        if(count % pageSize == 0)
            return count / pageSize;
        
        return (count / pageSize) + 1;
    }

    public void updateClinic() {
        this.clinicDao.updateClinic(this.selectedClinic);
    }
    
    public void delClinic() {
        this.clinicDao.delete(this.selectedClinic);
    }
}
