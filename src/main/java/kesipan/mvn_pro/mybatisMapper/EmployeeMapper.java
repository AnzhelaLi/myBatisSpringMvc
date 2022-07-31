package kesipan.mvn_pro.mybatisMapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kesipan.mvn_pro.entity.Employee;
import util.myBatisUtil;

@Repository
public class EmployeeMapper {

	public List<Employee> getAllEmployees() {
		
		SqlSession session = myBatisUtil.getSqlSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Employee> employeeList = session.selectList("getAllEmployees");
		
		return employeeList;
	}
	
	public void delete(int employeeId) {
	
		SqlSession session = myBatisUtil.getSqlSessionFactory().openSession();
		session.delete("deleteEmployee", employeeId);
		
	
	}
	
	public Employee getEmployeeById(int employeeId) {
		SqlSession session = myBatisUtil.getSqlSessionFactory().openSession();
		Employee employeeFromDb = (Employee) session.selectOne("findById", employeeId);
		
		return employeeFromDb;
	}
	
	public Employee updateEmployee(Employee employee) {
		SqlSession session = myBatisUtil.getSqlSessionFactory().openSession();
		session.update("updateEmployee", employee);
		
		return employee;
		
	}
	
	public Employee add(Employee newEmployee) {
		SqlSession session = myBatisUtil.getSqlSessionFactory().openSession();
		session.insert("addNewEmployee", newEmployee);
		
		return newEmployee;
	}
}
