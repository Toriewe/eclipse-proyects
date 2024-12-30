package example_jpa.service;

import java.util.ArrayList;
import java.util.List;

import example_jpa.model.User;
import example_jpa.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

public class UserService {

	EntityManager entityManager = JPAUtil.getEntityManager();

	public Long add(User user) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(user);
			entityManager.getTransaction().commit();
			return user.getUserId();
		} catch (Exception e) {
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return null;
		}
	}

	public User update(User user) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(user);
			entityManager.getTransaction().commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<User> list() {
		try {
			List<User> users = new ArrayList<>();
			Query query = entityManager.createQuery("Select u from User u");
			users = query.getResultList();
			return users;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public User find(Long id) {
		try {
			User user = entityManager.find(User.class, id);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public User findEmail (String email) {
		try {
			Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email");
            query.setParameter("email", email);
            return (User) query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void delete(Long id) {
		try {
			User user = entityManager.find(User.class, id);
			entityManager.getTransaction().begin();
			entityManager.remove(user);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			entityManager.getTransaction().rollback();
		}
	}
}
