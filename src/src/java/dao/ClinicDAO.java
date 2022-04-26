package dao;

import entities.City;
import entities.Clinic;
import entities.District;
import entities.Doctor;
import entities.Supervisor;
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
}
