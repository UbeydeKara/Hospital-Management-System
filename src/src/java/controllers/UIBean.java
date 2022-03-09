package controllers;

import entities.User;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.Iterator;

/**
 *
 * @author Ubeyde
 * 
**/

@Named("uiBean")
@ViewScoped
public class UIBean implements Serializable {
    private Boolean isLoginPage;
    private User selectedUser;

    public Boolean isLoginPage() {
        if(isLoginPage != null)
            return isLoginPage;
        else if(FacesContext.getCurrentInstance().getViewRoot().getViewId().equals("/views/signin.xhtml"))
            return true;
        return false;
    }

    public void switchPage() {
        this.isLoginPage = !isLoginPage();
    }
    
    public User getSelectedUser() {
        return selectedUser;
    }
    
    public void setSelectedUser(User user) {
        if(user != null)
            selectedUser = user;
    }
    
    public boolean getHasMessage() {
        Iterator<FacesMessage> iterator = FacesContext.getCurrentInstance().getMessages();
        return (iterator != null) && (iterator.hasNext());
    }

    public String getErrorMessage() {
        Iterator<FacesMessage> iterator = FacesContext.getCurrentInstance().getMessages();
        return iterator.hasNext() ? iterator.next().getSummary() : "";
    }

    public String getMessageSeverity() {
        Iterator<FacesMessage> iterator = FacesContext.getCurrentInstance().getMessages();
        
        if(iterator.hasNext()) {
            FacesMessage.Severity severity = iterator.next().getSeverity();
            return severity == FacesMessage.SEVERITY_INFO ? "success" : "warning";
        }
        
        return "error";
    }
}
