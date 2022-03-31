package dao;

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
 * @author ubeyde
 *
 *
 */
@Stateless
public class UserDAO {

    @PersistenceContext(name = "jpa_PU")
    private EntityManager em;

    public Supervisor login(Supervisor entity) {
        Supervisor user = isUserExists(entity);

        if (user != null) {
            if (user.getIs_confirmed() == false) {
                FacesContext.getCurrentInstance().addMessage(
                        "response",
                        new FacesMessage(FacesMessage.SEVERITY_WARN,
                                "Hesabınız henüz onaylanmadı",
                                null));
            } else {
                HttpSession session = SessionUtil.getSession();
                session.setAttribute("user", (Supervisor) user);
                return user;
            }
        } else
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_WARN,
                            "Bilgileriniz Hatalı",
                            null));
        return null;

    }

    public void register(Supervisor entity, Boolean isRegister) {

        if (isRegister) {
            Supervisor user = isUserExists(entity);
            if (user == null) {
                entity.setIs_confirmed(false);
                em.persist(entity);
                FacesContext.getCurrentInstance().addMessage(
                        "response",
                        new FacesMessage(FacesMessage.SEVERITY_INFO,
                                "Kayıt Başarılı. Giriş yapabilmek için hesabınızın onaylanmasını bekleyin.",
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

    public List<Supervisor> findByName(String fullname) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Supervisor> root = criteriaQuery.from(Supervisor.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.like(root.get("fullname"), "%" + fullname + "%"));

        Query query = em.createQuery(criteriaQuery);
        return query.getResultList();
    }

    public void delete(User entity) {
        em.remove(em.merge(entity));
        FacesContext.getCurrentInstance().addMessage(
                "response",
                new FacesMessage(FacesMessage.SEVERITY_INFO,
                        "Kullanıcı Silindi",
                        null));
    }

    public List<Supervisor> findAll(Integer pageNumber, Integer pageSize) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Supervisor> criteria = builder.createQuery(Supervisor.class);
        Root<Supervisor> root = criteria.from(Supervisor.class);
        criteria.orderBy(builder.asc(root.get("id")));
        Query query = em.createQuery(criteria);
        query.setFirstResult(pageNumber * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    public Long userCount() {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> countQuery = criteriaBuilder.createQuery(Long.class);
        countQuery.select(criteriaBuilder.count(countQuery.from(Supervisor.class)));
        return em.createQuery(countQuery).getSingleResult();
    }

    public List<Privilege> findAllRole() {
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(Privilege.class));
        return em.createQuery(cq).getResultList();
    }

    public void updateVisor(Supervisor entity) {
        if(entity.getEmail() != null) {
        em.merge(entity);
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Kayıt Güncellendi",
                            null));
        }
    }

    private Supervisor isUserExists(Supervisor entity) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<Supervisor> root = criteriaQuery.from(Supervisor.class);

        criteriaQuery.select(root);
        criteriaQuery.where(
                builder.equal(root.get("email"), entity.getEmail()),
                builder.equal(root.get("password"), entity.getPassword()));

        Query query = em.createQuery(criteriaQuery);

        if (query.getResultList().isEmpty()) {
            return null;
        } else {
            return (Supervisor) query.getSingleResult();
        }
    }
}
