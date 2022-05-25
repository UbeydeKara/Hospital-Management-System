package dao;

import entities.Appointment;
import entities.LabResult;
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
public class LabResultDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;


    public List<LabResult> findAll(Integer pageNumber, Integer pageSize) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<LabResult> criteria = builder.createQuery(LabResult.class);
        Root<LabResult> root = criteria.from(LabResult.class);
        criteria.orderBy(builder.asc(root.get("id")));
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long labResultCount() {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        countQuery.select(criteriaBuilder.count(countQuery.from(Appointment .class)));
        return em.createQuery(countQuery).getSingleResult();
    }

   
}
