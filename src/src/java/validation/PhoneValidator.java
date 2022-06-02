/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validation;

import jakarta.annotation.ManagedBean;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.validator.FacesValidator;
import jakarta.faces.validator.Validator;
import jakarta.faces.validator.ValidatorException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



/**
 *
 * @author nur
 */

@FacesValidator("phoneValidator")
public class PhoneValidator implements Validator {

    public PhoneValidator() {
    }

    @Override
    public void validate(FacesContext fc, UIComponent uic, Object obj) throws ValidatorException {

        String phone = (String) obj;

        Pattern ptrn = Pattern.compile("\\d{10}");
        Matcher match = ptrn.matcher(phone);

        if (!match.find() || !match.group().equals(phone)) {
            FacesMessage msg = new FacesMessage(
                    " Lütfen geçerli bir telefon numarası giriniz");
            msg.setSeverity(FacesMessage.SEVERITY_WARN);

            throw new ValidatorException(msg);
        }

    }
}
