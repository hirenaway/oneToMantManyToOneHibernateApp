package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bean.Department;
import com.bean.Employee;
import com.util.AppUtil;

public class AppDao {

	public static void addDepartment(Department department) {
		SessionFactory factory = AppUtil.getSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		session.save(department);
		session.getTransaction().commit();
		session.close();
	}

	public static void addEmployee(Employee employee) {
		SessionFactory factory = AppUtil.getSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(employee);
		session.getTransaction().commit();
		session.close();
	}

	public static List<Department> getAlldepartments() {
		SessionFactory factory = AppUtil.getSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		List<Department> list = session.createQuery("FROM Department").list();
		session.close();
		return list;
	}

	public static Department getDepartment(int id) {
		SessionFactory factory = AppUtil.getSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		Department department = session.get(Department.class, id);
		session.close();
		return department;
	}

	public static List<Employee> getAllEmployee() {
		SessionFactory factory = AppUtil.getSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		List<Employee> list = session.createQuery("FROM Employee").list();
		session.close();
		return list;
	}

	public static Employee getEmployee(int id) {
		SessionFactory factory = AppUtil.getSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		Employee employee = (Employee) session.createQuery("FROM Employee E WHERE E.employeeId =:empId")
				.setParameter("empId", id).uniqueResult();
		session.close();
		return employee;
	}

	public static void deleteEmployee(int id) {
		SessionFactory factory = AppUtil.getSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		Employee employee = (Employee) session.createQuery("FROM Employee E WHERE E.employeeId =:empId")
				.setParameter("empId", id).uniqueResult();
		session.delete(employee);
		session.getTransaction().commit();
		session.close();
	}
}
