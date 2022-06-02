/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validation;

import jakarta.faces.application.FacesMessage;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.validator.FacesValidator;
import jakarta.faces.validator.Validator;
import jakarta.faces.validator.ValidatorException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;



/**
 *
 * @author nur
 */

@FacesValidator("dateValidator")
public class DateValidator implements Validator {

    public DateValidator() {
    }

    @Override
    public void validate(FacesContext fc, UIComponent uic, Object obj) throws ValidatorException {

        LocalDate birthday = (LocalDate) obj;
        
        LocalDate today = LocalDate.now();
        Period p = Period.between(birthday, today);

        if (p.getYears() < 18) {
            FacesMessage msg = new FacesMessage(
                    " Lütfen geçerli bir doğum tarihi giriniz");
            msg.setSeverity(FacesMessage.SEVERITY_WARN);

            throw new ValidatorException(msg);
        }

    }
}
