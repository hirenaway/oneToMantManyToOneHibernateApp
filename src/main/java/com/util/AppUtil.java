package com.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Department;
import com.bean.Employee;

public class AppUtil {

	public static SessionFactory sessionFactory = null;

	public static SessionFactory getSessionFactory() {
		if(sessionFactory == null) {
			sessionFactory = new Configuration()
							.configure()
							.addAnnotatedClass(Department.class)
							.addAnnotatedClass(Employee.class)
							.buildSessionFactory();
			return sessionFactory;
		}
		return sessionFactory;
	}

}
