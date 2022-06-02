package dao;

import entities.Appointment;
import entities.Examination;
import entities.Patient;
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
public class ExaminationDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;


    public List<Examination> findAll(Integer pageNumber, Integer pageSize) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Examination> criteria = builder.createQuery(Examination.class);
        Root<Examination> root = criteria.from(Examination.class);
        criteria.orderBy(builder.asc(root.get("id")));
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long examinationCount() {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        countQuery.select(criteriaBuilder.count(countQuery.from(Examination.class)));
        return em.createQuery(countQuery).getSingleResult();
    }

    public Long examinationCountP(Patient patient) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        Root<Examination> root = countQuery.from(Examination.class);
        countQuery.select(criteriaBuilder.count(root));
        countQuery.where(criteriaBuilder.equal(root.get("patient"), patient));
        return em.createQuery(countQuery).getSingleResult();
    }
    
    public Examination findByPatient(Patient patient) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Examination> root = criteriaQuery.from(Examination.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.equal(root.get("patient"), patient));

        Query query = em.createQuery(criteriaQuery);
        return (Examination)query.getResultList().get(0);
    }

   
}
