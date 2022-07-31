package kesipan.mvn_pro.dao;

import java.util.List;

import kesipan.mvn_pro.entity.Employee;

public interface EmployeeDao {

	List<Employee> getAllEmployees();
	
	void delete(int employeeId);
	
	Employee getEmployeeById(int employeeId);
	
	Employee updateEmployee(Employee employee);
	
	Employee add(Employee newEmployee);
	
}
