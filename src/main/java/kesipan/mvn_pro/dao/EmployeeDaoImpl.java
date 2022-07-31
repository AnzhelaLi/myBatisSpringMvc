package kesipan.mvn_pro.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kesipan.mvn_pro.entity.Employee;
import kesipan.mvn_pro.mybatisMapper.EmployeeMapper;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	private EmployeeMapper mapper;
	
	@Autowired
	public EmployeeDaoImpl(EmployeeMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<Employee> getAllEmployees() {
		// TODO Auto-generated method stub
		return mapper.getAllEmployees();
	}

	@Override
	public void delete(int employeeId) {
		// TODO Auto-generated method stub
		mapper.delete(employeeId);
	}

	@Override
	public Employee getEmployeeById(int employeeId) {
		// TODO Auto-generated method stub
		return mapper.getEmployeeById(employeeId);
	}

	@Override
	public Employee updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return mapper.updateEmployee(employee);
	}

	@Override
	public Employee add(Employee newEmployee) {
		// TODO Auto-generated method stub
		return mapper.add(newEmployee);
	}
}
