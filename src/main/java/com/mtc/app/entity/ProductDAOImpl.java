
package com.mtc.app.entity;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.mtc.app.util.HibernateUtil;

@Repository("productdao")
public class ProductDAOImpl implements InterfaceProduct {

	@Override
	public List<product> fetchProduct() {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		session.beginTransaction();

		Query query = session.createQuery("from product");

		List<product> products = query.list();

		session.getTransaction().commit();

		session.close();

		return products;
	}

	@Override
	public product fetchProductById(int id) {

		product product = null;

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		session.beginTransaction();

		String queryString = "from product where id = :id";

		Query query = session.createQuery(queryString);

		query.setInteger("id", id);

		product = (product) query.uniqueResult();

		session.getTransaction().commit();

		session.close();

		return product;
	}

	public void deleteProduct(int id) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		session.beginTransaction();

		String queryString = "delete product where id = :id";

		Query query = session.createQuery(queryString);

		query.setInteger("id", id);

		query.executeUpdate();
		
		session.getTransaction().commit();

		session.close();

	}

	@Override
	public void addProduct(product product) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		
		Session session = sessionFactory.openSession();

		session.beginTransaction();

		session.save(product);

		session.getTransaction().commit();

		session.close();

	}

	@Override
	public void editProduct(product product) {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		
		Session session = sessionFactory.openSession();

		session.beginTransaction();
		
		session.update(product);
		
		session.getTransaction().commit();

		session.close();

	}

}
