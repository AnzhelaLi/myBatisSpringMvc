package kesipan.mvn_pro.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kesipan.mvn_pro.dao.EmployeeDao;
import kesipan.mvn_pro.entity.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeDao employeeDao;
	
	public EmployeeServiceImpl(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	
	@Override
	public List<Employee> getAllEmployees() {
		// TODO Auto-generated method stub
		return employeeDao.getAllEmployees();
	}


	@Override
	public void delete(int employeeId) {
		// TODO Auto-generated method stub
		employeeDao.delete(employeeId);
	}

	
	@Override
	public Employee getEmployeeById(int employeeId) {
		// TODO Auto-generated method stub
		return employeeDao.getEmployeeById(employeeId);
	}

	
	@Override
	public Employee updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return employeeDao.updateEmployee(employee);
	}

	@Override
	public Employee add(Employee newEmployee) {
		// TODO Auto-generated method stub
		return employeeDao.add(newEmployee);
	}

}
