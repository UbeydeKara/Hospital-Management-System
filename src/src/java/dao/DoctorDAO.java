package dao;

import entities.Privilege;
import entities.Doctor;
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
 * @author vasim
 *
 *
 */
@Stateless
public class DoctorDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

    public Doctor login(Doctor entity) {
        Doctor doctor = isDoctorExists(entity);

        if (doctor != null) {
            HttpSession session = SessionUtil.getSession();
            session.setAttribute("user", (Doctor) doctor);
            return doctor;
        } else {
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_WARN,
                            "Bilgileriniz Hatalı",
                            null));
            return null;
        }

    }

    public void register(Doctor entity, Boolean isRegister) {
        if (entity.getEmail() != null) {
            if (isRegister) {
                Doctor doctor = isDoctorExists(entity);
                if (doctor == null) {
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
    }

    public void logout() {
        HttpSession session = SessionUtil.getSession();
        session.invalidate();
    }

    public List<Doctor> findByName(String fullname) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Doctor> root = criteriaQuery.from(Doctor.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.like(root.get("fullname"), "%" + fullname + "%"));

        Query query = em.createQuery(criteriaQuery);
        return query.getResultList();
    }

    public void updateDoctor(Doctor entity) {
        if (entity.getEmail() != null) {
            em.merge(entity);
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Kayıt Güncellendi",
                            null));
        }
    }

    public List<Doctor> findByEmail(String email) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Doctor> root = criteriaQuery.from(Doctor.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.equal(root.get("email"), email));

        Query query = em.createQuery(criteriaQuery);
        return query.getResultList();
    }

    public void delete(Doctor entity) {
        em.remove(em.merge(entity));
        FacesContext.getCurrentInstance().addMessage(
                "response",
                new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Kullanıcı Silindi",
                        null));
    }

    public List<Doctor> findAll(Integer pageNumber, Integer pageSize) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Doctor> criteria = builder.createQuery(Doctor.class);
        Root<Doctor> root = criteria.from(Doctor.class);
        criteria.orderBy(builder.asc(root.get("id")));
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long doctorCount() {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        countQuery.select(criteriaBuilder.count(countQuery.from(Doctor.class)));
        return em.createQuery(countQuery).getSingleResult();
    }

    public List<Privilege> findAllRole() {
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(Privilege.class));
        return em.createQuery(cq).getResultList();
    }

    private Doctor isDoctorExists(Doctor entity) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Doctor> root = criteriaQuery.from(Doctor.class);

        criteriaQuery.select(root);
        criteriaQuery.where(
                builder.equal(root.get("email"), entity.getEmail()),
                builder.equal(root.get("password"), entity.getPassword()));

        Query query = em.createQuery(criteriaQuery);

        if (query.getResultList().isEmpty()) {
            return null;
        } else {
            return (Doctor) query.getSingleResult();
        }
    }
}
