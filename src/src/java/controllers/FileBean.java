package controllers;

import dao.FileDAO;
import entities.Patient;
import entities.Photo;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.nio.file.Files;

/**
 *
 * @author nur
 *
 *
 */
@Named("fileBean")
@SessionScoped
public class FileBean implements Serializable {

    @EJB
    private FileDAO fileDao;
    private Part file;
    private final String directoryPath = "../../static/pp/";

    public Part getFile() {
        return file;
    }

    public void setFile(Part file) {
        this.file = file;
    }

    public String uploadFile(Patient patient) throws IOException {
        InputStream input = file.getInputStream();
        String path = directoryPath + file.getSubmittedFileName();
        String fpath = "D:\\HMSProject\\src\\web\\static\\pp\\" + file.getSubmittedFileName();
        File f = new File(fpath);
        
        Photo photo = new Photo();
        photo.setPath(path);
        photo.setUser(patient);
        fileDao.upload(photo);
        Files.copy(input, f.toPath());
        
        return "patient/overview?faces-redirect=true";
    }
    
    public String getFileByPatient(Patient patient) {
        Photo photo_file = fileDao.getFileByUser(patient);
        
        if (photo_file == null)
            return "https://fomantic-ui.com/images/avatar2/large/matthew.png";
        
        return photo_file.getPath();
    }
}
