package by.epam.inner.controllers;

import by.epam.inner.model.pojo.Article;
import by.epam.inner.model.pojo.User;
import by.epam.inner.model.repos.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import static by.epam.inner.model.Utilities.getErrors;

@Controller
@RequestMapping("/articles")
public class ArticlesController {

    @Autowired
    private ArticleRepository articleRepository;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping
    public String getArticles(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Article> articles = articleRepository.findAll();
        if (filter != null && !filter.isEmpty()) {
            articles = articleRepository.findAllByName(filter);
        }
        model.addAttribute("articles", articles);
        model.addAttribute("filter", filter);
        return "articles";
    }

    @PostMapping
    public String addArticle(
            @AuthenticationPrincipal User user,
            @Valid Article article,
            BindingResult bindingResult, // Before model
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        article.setAuthor(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("article", article);
        } else {
            if (file != null && file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + file.getOriginalFilename();
                file.transferTo(new File(uploadPath + "/" + resultFilename));
                article.setFilename(resultFilename);
            }
            model.addAttribute("article", null);
            articleRepository.save(article);
        }
        Iterable<Article> articles = articleRepository.findAll();
        model.addAttribute("articles", articles);
        return "articles";
    }
}
