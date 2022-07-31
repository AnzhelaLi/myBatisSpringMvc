package kesipan.mvn_pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping("/")
	public String defaultPage() {
		return "employeeList";
	}
	

}
