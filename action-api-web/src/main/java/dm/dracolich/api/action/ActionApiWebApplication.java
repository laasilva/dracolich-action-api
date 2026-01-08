package dm.dracolich.api.action;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = {"dm.dracolich.api.action.entity"})
public class ActionApiWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(ActionApiWebApplication.class, args);
    }

}
