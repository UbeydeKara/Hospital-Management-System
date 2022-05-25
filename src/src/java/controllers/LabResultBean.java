package controllers;

import dao.LabResultDAO;
import entities.LabResult;
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
@Named("labResultBean")
@SessionScoped
public class LabResultBean implements Serializable {

    @EJB
    private LabResultDAO labResultDao;
    private LabResult labResult;
    private List<LabResult> list;
    private Integer pageNumber = 0;
    private Integer pageSize = 8;
    private String searchText;

  public LabResult getLabResult() {
        if (this.labResult == null) {
            return this.labResult = new LabResult();
        }
        return labResult;
    }

    public void setLabResult(LabResult labResult) {
        this.labResult = labResult;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }
    
    public Long getUserCount() {
        return this.labResultDao.labResultCount();
    }
    
    public Integer getTotalPage() {
        Integer count = getUserCount().intValue();
        
        if(count == 0)
            return 1;
        
        if(count % 7 == 0)
            return count / 7;
        
        return (count / 7) + 1;
    }


    public List<LabResult> getList() {
        if(searchText == null || searchText.length() == 0)
            return this.labResultDao.findAll(pageNumber, pageSize);
        return null;
    }

    public void setList(List<LabResult> list) {
        this.list = list;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

}
