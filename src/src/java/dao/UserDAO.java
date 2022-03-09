package dao;

import entities.Privilege;
import entities.User;
import jakarta.ejb.Stateless;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.Tuple;
import jakarta.persistence.TypedQuery;
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
    
    @PersistenceContext(name="jpa_PU")
    private EntityManager em;

    public Boolean login(User entity) {
        User user = isUserExists(entity);

        if (user != null) {
            HttpSession session = SessionUtil.getSession();
            session.setAttribute("user", (User) user);
            return true;
        } else {
            FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_WARN,
                            "Bilgileriniz Hatalı",
                            null));
            return false;
        }
        
    }

    public void register(User entity, Boolean isRegister) {

        if (isRegister) {
            Object user = isUserExists(entity);
            if (user == null) {
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

    public void delete(User entity) {
        em.remove(em.merge(entity));
        FacesContext.getCurrentInstance().addMessage(
                    "response",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Kullanıcı Silindi",
                            null));
    }

    public List<User> findAll() {
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(User.class));
        return em.createQuery(cq).getResultList();
    }

    public List<Privilege> findAllRole() {
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(Privilege.class));
        return em.createQuery(cq).getResultList();
    }

    private User isUserExists(User entity) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = builder.createQuery();
        Root<User> root = criteriaQuery.from(User.class);

        criteriaQuery.select(root);
        criteriaQuery.where(builder.equal(root.get("email"), entity.getEmail()),
                builder.equal(root.get("password"), entity.getPassword()));

        Query query = em.createQuery(criteriaQuery);
        
        if(query.getResultList().isEmpty())
            return null;
        else
            return (User) query.getSingleResult();
    }
}
