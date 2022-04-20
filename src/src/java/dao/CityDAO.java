package dao;

import entities.City;
import entities.District;
import entities.Doctor;
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
public class CityDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

    public District findByName(String name) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Doctor> root = criteriaQuery.from(District.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.like(root.get("name"), name));

        Query query = em.createQuery(criteriaQuery);
        return (District) query.getResultList().get(0);
    }
    
    public List<City> findAll() {
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(City.class));
        return em.createQuery(cq).getResultList();
    }
}
