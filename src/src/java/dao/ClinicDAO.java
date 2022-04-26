package dao;

import entities.City;
import entities.Clinic;
import entities.District;
import entities.Doctor;
import entities.Supervisor;
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
public class ClinicDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

    public List<Clinic> findByName(String name) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Clinic> root = criteriaQuery.from(Clinic.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.like(root.get("name"), "%" + name + "%"));

        Query query = em.createQuery(criteriaQuery);
        return query.getResultList();
    }
    
    public List<Clinic> findAll(Integer pageNumber, Integer pageSize) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Clinic> criteria = builder.createQuery(Clinic.class);
        Root<Clinic> root = criteria.from(Clinic.class);
        criteria.orderBy(builder.asc(root.get("id")));
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long clinicCount() {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        countQuery.select(criteriaBuilder.count(countQuery.from(Clinic.class)));
        return em.createQuery(countQuery).getSingleResult();
    }

    public void updateClinic(Clinic entity) {
        if (entity.getName() != null) {
            em.merge(entity);
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Kayıt Güncellendi",
                            null));
        }
    }
    
    

    public void delete(Clinic entity) {
        em.remove(em.merge(entity));
        FacesContext.getCurrentInstance().addMessage(
                "response",
                new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Klinik Silindi",
                        null));
    }
}
