package by.epam.inner.model.pojo;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @NotBlank(message = "Пожалуйста, напишите название статьи!")
    @Length(max = 255, message = "Название статьи сильно длинное!")
    private String name;

    @NotBlank(message = "Пожалуйста, напишите текст статьи!")
    @Length(max = 2048, message = "Текст статьи сильно длинный!")
    private String text;
    private String filename;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public Article() {}

    public Article(User author, String name, String text) {
        this.author = author;
        this.name = name;
        this.text = text;
    }

    public Article(String name, String text) {
        this.name = name;
        this.text = text;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<unknown author>";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
