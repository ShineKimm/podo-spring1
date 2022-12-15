package podo.podospring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import podo.podospring.common.LogTest;
@SpringBootApplication
public class PodoSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(PodoSpringApplication.class, args);

		LogTest logTest = new LogTest();
		logTest.printLog();
	}

}
