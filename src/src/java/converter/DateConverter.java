/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package converter;

import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.convert.Converter;
import jakarta.faces.convert.ConverterException;
import jakarta.faces.convert.DateTimeConverter;
import jakarta.faces.convert.FacesConverter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Ubeyde
 */
@FacesConverter("dateConverter")
public class DateConverter implements Converter {

    @Override
    public Object getAsObject(FacesContext fc, UIComponent uic, String string) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(string, formatter);
        return localDate;
    }

    @Override
    public String getAsString(FacesContext fc, UIComponent uic, Object t) {
        LocalDate localDate = (LocalDate) t;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return localDate.format(formatter);
    }

}
