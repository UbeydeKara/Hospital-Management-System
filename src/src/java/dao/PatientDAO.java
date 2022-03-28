package dao;

import entities.Privilege;
import entities.Patient;
import entities.Patient;
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
public class PatientDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

    public Patient login(Patient entity) {
        Patient patient = isPatientExists(entity);

        if (patient != null) {
            HttpSession session = SessionUtil.getSession();
            session.setAttribute("user", (Patient) patient);
            return patient;
        } else {
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_WARN,
                            "Bilgileriniz Hatalı",
                            null));
            return null;
        }

    }

    public void register(Patient entity, Boolean isRegister) {

        if (isRegister) {
            Patient patient = isPatientExists(entity);
            if (patient == null) {
                em.persist(entity);
                FacesContext.getCurrentInstance().addMessage(
                        "response",
                        new FacesMessage(FacesMessage.SEVERITY_INFO,
                                "Kayıt Başarılı",
                                null));
            } else {
                FacesContext.getCurrentInstance().addMessage(
                        "response",
                        new FacesMessage(FacesMessage.SEVERITY_WARN,
                                "Bu kullanıcı zaten kayıtlı",
                                null));
            }
        } else {
            em.merge(entity);
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Kayıt Güncellendi",
                            null));
        }
    }

    public void logout() {
        HttpSession session = SessionUtil.getSession();
        session.invalidate();
    }
    
    public void updatePatient(Patient entity) {
        em.merge(entity);
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Kayıt Güncellendi",
                            null));
    }

    public List<Patient> findByEmail(String email) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Patient> root = criteriaQuery.from(Patient.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.equal(root.get("email"), email));

        Query query = em.createQuery(criteriaQuery);
        return query.getResultList();
    }

    public void delete(Patient entity) {
        em.remove(em.merge(entity));
        FacesContext.getCurrentInstance().addMessage(
                "response",
                new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Kullanıcı Silindi",
                        null));
    }

    public List<Patient> findAll(Integer pageNumber) {
        int pageSize = 7;
        CriteriaQuery criteria = em.getCriteriaBuilder().createQuery();
        criteria.select(criteria.from(Patient.class));
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber*7);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long patientCount() {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        countQuery.select(criteriaBuilder.count(countQuery.from(Patient.class)));
        return em.createQuery(countQuery).getSingleResult();
    }

    public List<Privilege> findAllRole() {
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(Privilege.class));
        return em.createQuery(cq).getResultList();
    }

    private Patient isPatientExists(Patient entity) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Patient> root = criteriaQuery.from(Patient.class);

        criteriaQuery.select(root);
        criteriaQuery.where(
                builder.equal(root.get("email"), entity.getEmail()),
                builder.equal(root.get("password"), entity.getPassword()));

        Query query = em.createQuery(criteriaQuery);

        if (query.getResultList().isEmpty()) {
            return null;
        } else {
            return (Patient) query.getSingleResult();
        }
    }
}
