package podo.podospring;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class PodoSpringApplication extends SpringBootServletInitializer {

	private static Logger logger = LoggerFactory.getLogger(PodoSpringApplication.class);

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(PodoSpringApplication.class);
	}
	public static void main(String[] args) {
		SpringApplication.run(PodoSpringApplication.class, args);

		logger.info("========== PodoSpringApplication log ==========");
	}

}
