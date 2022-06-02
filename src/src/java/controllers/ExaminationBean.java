package controllers;

import dao.ExaminationDAO;
import entities.Examination;
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
@Named("examinationBean")
@SessionScoped
public class ExaminationBean implements Serializable {

    @EJB
    private ExaminationDAO examinationDao;
    private Examination examination;
    private List<Examination> list;
    private Integer pageNumber = 0;
    private Integer pageSize = 8;
    private String searchText;

  public Examination getExamination() {
        if (this.examination == null) {
            return this.examination = new Examination();
        }
        return examination;
    }

    public void setExamination(Examination examination) {
        this.examination = examination;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }
    
    public Long getUserCount() {
        return this.examinationDao.examinationCount();
    }
    
    public Integer getTotalPage() {
        Integer count = getUserCount().intValue();
        
        if(count == 0)
            return 1;
        
        if(count % 7 == 0)
            return count / 7;
        
        return (count / 7) + 1;
    }


    public List<Examination> getList() {
        if(searchText == null || searchText.length() == 0)
            return this.examinationDao.findAll(pageNumber, pageSize);
        return null;
    }

    public void setList(List<Examination> list) {
        this.list = list;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

}
