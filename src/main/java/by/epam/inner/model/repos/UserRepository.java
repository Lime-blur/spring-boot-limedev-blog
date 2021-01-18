package by.epam.inner.model.repos;

import by.epam.inner.model.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    List<User> findAllByUsername(String username);
    User findByActivationCode(String code);
}
