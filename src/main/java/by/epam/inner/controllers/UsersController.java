package by.epam.inner.controllers;

import by.epam.inner.model.pojo.User;
import by.epam.inner.model.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public String getUsers(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<User> users = userRepository.findAll();
        if (filter != null && !filter.isEmpty()) {
            users = userRepository.findAllByUsername(filter);
        }
        model.addAttribute("users", users);
        model.addAttribute("filter", filter);
        return "users";
    }
}
