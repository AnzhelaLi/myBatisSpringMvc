package kesipan.mvn_pro;

import java.util.HashMap;
import java.util.List;

import kesipan.mvn_pro.dao.EmployeeDao;
import kesipan.mvn_pro.entity.Employee;

public class test {

	private EmployeeDao dao;
	Employee employee;
	
	  List<Employee> list = dao.getAllEmployees();
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
  
	}

}
