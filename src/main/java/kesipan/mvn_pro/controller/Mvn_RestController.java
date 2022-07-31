package kesipan.mvn_pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import kesipan.mvn_pro.entity.Employee;
import kesipan.mvn_pro.service.EmployeeService;

@RestController
@RequestMapping("/rest")
public class Mvn_RestController {

	private EmployeeService employeeService;

	@Autowired
	public Mvn_RestController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<List<Employee>> listEmployee() {
		return new ResponseEntity<>(employeeService.getAllEmployees(), HttpStatus.OK);
	}

	@RequestMapping(value = "/employee/{id}", method = RequestMethod.GET)
	public ResponseEntity<Employee> getById(@PathVariable("id") int id) {
		return new ResponseEntity<>(employeeService.getEmployeeById(id), HttpStatus.OK);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteEmployee(@PathVariable("id") int employeeId) {
		employeeService.delete(employeeId);
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}

	@RequestMapping(value = "/updateEmployee/{id}", method = RequestMethod.PUT)
	public void updateEmployee(@PathVariable("id") int id, @RequestBody Employee employee) {
		employee = employeeService.getEmployeeById(id);
		employeeService.updateEmployee(employee);
	}

	@RequestMapping(value = "/addNewEmployee", method = RequestMethod.POST)
	public ResponseEntity<Employee> insertEmployee(@RequestBody Employee newEmployee) {
		return new ResponseEntity<>(employeeService.add(newEmployee), HttpStatus.OK);

	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public Employee update(@RequestBody Employee employee) {
		return employeeService.updateEmployee(employee);
	}

}
