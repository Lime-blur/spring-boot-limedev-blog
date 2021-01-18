package by.epam.inner.model;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

public class Utilities {

    public static Number parseNumber(String number) {
        try {
            return Long.parseLong(number);
        } catch (NumberFormatException e1) {
            try {
                return Integer.parseInt(number);
            } catch (NumberFormatException e2) {
                return -1;
            }
        }
    }

    public static Map<String, String> getErrors(BindingResult bindingResult) {
        Collector<FieldError, ?, Map<String, String>> collector = Collectors.toMap(
                fieldError -> fieldError.getField() + "Error",
                FieldError::getDefaultMessage
        );
        return bindingResult.getFieldErrors().stream().collect(collector);
    }
}
