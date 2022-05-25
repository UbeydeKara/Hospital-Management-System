package dao;

import entities.Appointment;
import entities.Prescription;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import java.util.List;

/**
 *
 * @author nur
 *
 *
 */
@Stateless
public class PrescriptionDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

//    public List<Prescription> findByPatient(Patient patient) {
//        CriteriaBuilder builder = em.getCriteriaBuilder();
//        CriteriaQuery criteriaQuery = builder.createQuery();
//        Root<Prescription> root = criteriaQuery.from(Prescription.class);
//
//        criteriaQuery.select(root);
//        criteriaQuery.where(builder.like(root.get("fullname"), "%" + fullname + "%"));
//
//        Query query = em.createQuery(criteriaQuery);
//        return query.getResultList();
//    }
    

//    public void delete(Prescription entity) {
//        em.remove(em.merge(entity));
//        FacesContext.getCurrentInstance().addMessage(
//                "response",
//                new FacesMessage(FacesMessage.SEVERITY_INFO,
//                        "Reçete Silindi",
//                        null));
//    }

    public List<Prescription> findAll(Integer pageNumber, Integer pageSize) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Prescription> criteria = builder.createQuery(Prescription.class);
        Root<Prescription> root = criteria.from(Prescription.class);
        criteria.orderBy(builder.asc(root.get("id")));
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long prescriptionCount() {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        countQuery.select(criteriaBuilder.count(countQuery.from(Appointment .class)));
        return em.createQuery(countQuery).getSingleResult();
    }

//    public void update(Prescription entity) {
//        if (entity.getDate() != null) {
//            em.merge(entity);
//            FacesContext.getCurrentInstance().addMessage(
//                    "response",
//                    new FacesMessage(FacesMessage.SEVERITY_INFO,
//                            "Kayıt Güncellendi",
//                            null));
//        }
//    }

   
}
