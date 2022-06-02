package dao;

import entities.Appointment;
import entities.Doctor;
import entities.Patient;
import entities.Privilege;
import entities.Supervisor;
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
import jakarta.servlet.http.HttpSession;
import util.SessionUtil;
import java.util.List;

/**
 *
 * @author nur
 *
 *
 */
@Stateless
public class AppointmentDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

    public List<Appointment> findByDoctor(String fullname, Patient patient) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Appointment> root = criteriaQuery.from(Appointment.class);

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

    public void delete(Appointment entity) {
        em.remove(em.merge(entity));
        FacesContext.getCurrentInstance().addMessage(
                "response",
                new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Randevu Silindi",
                        null));
    }

    public List<Appointment> findAll(Integer pageNumber, Integer pageSize, Patient patient) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Appointment> criteria = builder.createQuery(Appointment.class);
        Root<Appointment> root = criteria.from(Appointment.class);
        criteria.orderBy(builder.asc(root.get("id")));
        
        if(patient != null)
            criteria.where(builder.equal(root.get("patient"), patient));
        
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long appointmentCount(Patient patient) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        Root<Appointment> root = countQuery.from(Appointment.class);
        
        if(patient != null)
            countQuery.where(criteriaBuilder.equal(root.get("patient"), patient));
        
        countQuery.select(criteriaBuilder.count(root));
        return em.createQuery(countQuery).getSingleResult();
    }

    public void update(Appointment entity) {
        if (entity.getDate() != null) {
            em.merge(entity);
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Kayıt Güncellendi",
                            null));
        }
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
