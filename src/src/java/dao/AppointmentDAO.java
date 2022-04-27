package dao;

import entities.Appointment;
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

    public List<Appointment> findByName(String fullname) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Appointment> root = criteriaQuery.from(Supervisor.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.like(root.get("fullname"), "%" + fullname + "%"));

        Query query = em.createQuery(criteriaQuery);
        return query.getResultList();
    }
    

    public void delete(Appointment entity) {
        em.remove(em.merge(entity));
        FacesContext.getCurrentInstance().addMessage(
                "response",
                new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Randevu Silindi",
                        null));
    }

    public List<Appointment> findAll(Integer pageNumber, Integer pageSize) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Appointment> criteria = builder.createQuery(Appointment.class);
        Root<Appointment> root = criteria.from(Appointment.class);
        criteria.orderBy(builder.asc(root.get("id")));
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long appointmentCount() {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        countQuery.select(criteriaBuilder.count(countQuery.from(Supervisor.class)));
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

   
}
