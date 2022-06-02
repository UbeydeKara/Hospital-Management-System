package dao;

import entities.Appointment;
import entities.Doctor;
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
public class PrescriptionDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

    public List<Prescription> findByDoctor(String fullname, Patient patient) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Prescription> root = criteriaQuery.from(Prescription.class);

        criteriaQuery.select(root);
        
        List<Doctor> doc = findDoctor(fullname);
        
        if(doc.isEmpty())
            return null;
        
        else {
            if(patient != null)
                criteriaQuery.where(builder.and(builder.equal(root.get("patient"), patient),
                        builder.equal(root.get("doctor"), doc.get(0))));

            else
                criteriaQuery.where(builder.equal(root.get("doctor"), doc.get(0)));

            Query query = em.createQuery(criteriaQuery);
            return query.getResultList();
        }
    }

    public List<Prescription> findAll(Integer pageNumber, Integer pageSize, Patient patient) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Prescription> criteria = builder.createQuery(Prescription.class);
        Root<Prescription> root = criteria.from(Prescription.class);
        criteria.orderBy(builder.asc(root.get("id")));
        
        if(patient != null)
            criteria.where(builder.equal(root.get("patient"), patient));
        
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long prescriptionCount(Patient patient) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        Root<Prescription> root = countQuery.from(Prescription.class);
        
        if(patient != null)
            countQuery.where(criteriaBuilder.equal(root.get("patient"), patient));
        
        countQuery.select(criteriaBuilder.count(root));
        return em.createQuery(countQuery).getSingleResult();
    }

    public List<Doctor> findDoctor(String fullname) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Doctor> root = criteriaQuery.from(Doctor.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.like(root.get("fullname"), "%" + fullname + "%"));

        Query query = em.createQuery(criteriaQuery);
        return query.getResultList();
    }
   
}
