package kesipan.mvn_pro.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;


@Configuration
@EnableWebMvc
@ComponentScan({"kesipan.mvn_pro"})
public class SpringConfig implements WebMvcConfigurer {

	
	
	   @Bean
	    public ViewResolver viewResolver() {
		   InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		   //resolver.setViewClass(JstlView.class);
		   resolver.setPrefix("/WEB-INF/jsps/");
		   resolver.setSuffix(".jsp");
		   return resolver;
		   
	   }
   }