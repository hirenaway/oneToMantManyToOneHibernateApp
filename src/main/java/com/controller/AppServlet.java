package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Department;
import com.bean.Employee;
import com.dao.AppDao;

@WebServlet("/AppServlet")
public class AppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("Add Department")) {
			Department department = new Department();
			department.setDepartmentName(request.getParameter("departmentName"));
			department.setOfficeLocation(request.getParameter("locationName"));
			AppDao.addDepartment(department);
			response.sendRedirect("add-department.jsp");
		} else if (action.equalsIgnoreCase("Add Employee") || action.equalsIgnoreCase("Update Employee")) {
			Employee employee = new Employee();
			if (action.equalsIgnoreCase("Update Employee")) {
				employee.setEmployeeId(Integer.parseInt(request.getParameter("employeeId")));
			}
			employee.setFirstName(request.getParameter("firstName"));
			employee.setLastName(request.getParameter("lastName"));
			employee.setEmail(request.getParameter("email"));
			int id = Integer.parseInt(request.getParameter("department"));
			Department selectedDepartment = AppDao.getDepartment(id);
			employee.setDepartment(selectedDepartment);
			AppDao.addEmployee(employee);
			response.sendRedirect("display-employee.jsp");
		} else if (action.equalsIgnoreCase("edit")) {
			int id = Integer.parseInt(request.getParameter("empId"));
			Employee employee = AppDao.getEmployee(id);
			request.setAttribute("employee", employee);
			request.getRequestDispatcher("add-employee.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("empId"));
			AppDao.getEmployee(id);
			request.getRequestDispatcher("add-employee.jsp").forward(request, response);
		}
	}

}
