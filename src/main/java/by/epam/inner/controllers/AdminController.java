package by.epam.inner.controllers;

import by.epam.inner.model.enums.Role;
import by.epam.inner.model.pojo.User;
import by.epam.inner.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String getAdmin(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<User> users = userService.findAll();
        if (filter != null && !filter.isEmpty()) {
            users = userService.findAllByUsername(filter);
        }
        model.addAttribute("users", users);
        model.addAttribute("filter", filter);
        return "admin";
    }

    @GetMapping("user/{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUser(user, username, form);
        return "redirect:/admin";
    }

    @PostMapping("delete-user")
    public String userDelete(
            @RequestParam("userId") User user
    ) {
        long userId = user.getId();
        if (userService.existsById(userId)) {
            userService.deleteById(userId);
        }
        return "redirect:/admin";
    }
}
