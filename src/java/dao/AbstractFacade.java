package dao;

import entities.User;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import jakarta.servlet.http.HttpSession;
import util.SessionUtil;

/**
 *
 * @author ubeyde
 *
 *
 */
public abstract class AbstractFacade<T> {

    private Class<T> entityClass;

    public AbstractFacade(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    protected abstract EntityManager getEntityManager();

    public Boolean login(T entity) {
        Object user = isUserExists(entity);

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

    public void register(T entity, Boolean isRegister) {

        if (isRegister) {
            Object user = isUserExists(entity);
            if (user == null) {
            getEntityManager().persist(entity);
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
                getEntityManager().merge(entity);
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

    public void delete(T entity) {
        getEntityManager().remove(getEntityManager().merge(entity));
    }

    public List<User> findAll() {
        CriteriaQuery cq = getEntityManager().getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return getEntityManager().createQuery(cq).getResultList();
    }

    private Object isUserExists(T entity) {
        CriteriaQuery criteria = getEntityManager().getCriteriaBuilder().createQuery();
        CriteriaBuilder builder = getEntityManager().getCriteriaBuilder();
        Root<T> root = criteria.from(entityClass);

        criteria.select(root);
        criteria.where(builder.equal(root.get("email"), ((User) entity).getEmail()),
                builder.equal(root.get("password"), ((User) entity).getPassword()));

        Query query = getEntityManager().createQuery(criteria);

        try {
            User user = (User) query.getSingleResult();
            return user;
        } catch (Exception msg) {
            return null;
        }
    }
}
