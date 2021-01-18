package by.epam.inner.model.repos;

import by.epam.inner.model.pojo.Article;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ArticleRepository extends CrudRepository<Article, Integer> {
    List<Article> findByName(String name);
    List<Article> findAllByName(String name);
}
