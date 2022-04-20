/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package converter;

import dao.CityDAO;
import entities.District;
import jakarta.ejb.EJB;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.convert.Converter;
import jakarta.faces.convert.FacesConverter;

/**
 *
 * @author Ubeyde
 * 
 */

@FacesConverter("cityConverter")
public class CityConverter implements Converter {

    @EJB
    private CityDAO cityDao;

    @Override
    public Object getAsObject(FacesContext fc, UIComponent uic, String string) {
        if (string != null && string.length() > 0) {
            return cityDao.findByName(string);
        }
        return "";
    }

    @Override
    public String getAsString(FacesContext fc, UIComponent uic, Object t) {
        if (t != null) {
            District d = (District)t;
            return String.valueOf(d.getName());
        }
        return null;
    }

}
