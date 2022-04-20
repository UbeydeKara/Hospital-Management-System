package controllers;

import dao.CityDAO;
import dao.PatientDAO;
import entities.City;
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
@Named("cityBean")
@SessionScoped
public class CityBean implements Serializable {

    @EJB
    private CityDAO cityDao;

    public List<City> getList() {
        return cityDao.findAll();
    }
}
