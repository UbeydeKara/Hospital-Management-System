package dao;

import entities.City;
import entities.District;
import entities.Doctor;
import entities.Photo;
import entities.Patient;
import entities.User;
import jakarta.ejb.Stateless;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.List;

/**
 *
 * @author ubeyde
 *
 *
 */
@Stateless
public class FileDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

    public void upload(Photo entity) {
        em.merge(entity);
        FacesContext.getCurrentInstance().addMessage(
                "response",
                new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Fotoğraf Güncellendi", null));
    }
    
    public Photo getFileByUser(Patient patient) {
        
        User user = findByPatient(patient);
        
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Photo> root = criteriaQuery.from(Photo.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.equal(root.get("user"), user));

        Query query = em.createQuery(criteriaQuery);
        List<Photo> list = query.getResultList();
        
        if(list.isEmpty())
            return null;
        
        return list.get(list.size()-1);
    }
    
     public User findByPatient(Patient patient) {
        return (User) em.find(User.class, patient.getId());
    }
}
