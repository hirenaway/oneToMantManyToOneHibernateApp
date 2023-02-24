package com.bean;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.Data;

@Entity
@Data
@Table(name = "department")
public class Department {

	@Id
	@GenericGenerator(name = "inc", strategy = "increment")
	@GeneratedValue(generator = "inc")
	@Column(name = "id")
	private Integer departmentId;

	@Column(name = "department_name")
	private String departmentName;

	@Column(name = "office_name")
	private String officeLocation;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "department")
	private Collection<Employee> employees;
}
