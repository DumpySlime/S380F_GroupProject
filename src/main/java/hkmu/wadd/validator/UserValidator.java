package hkmu.wadd.validator;

import hkmu.wadd.dao.CourseUserRepository;
import hkmu.wadd.model.CourseUser;
import jakarta.annotation.Resource;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validator;
import hkmu.wadd.controller.UserManagementController.Form;
import jakarta.validation.executable.ExecutableValidator;
import jakarta.validation.metadata.BeanDescriptor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import java.util.Set;

@Component
public class UserValidator implements Validator {
    @Resource
    CourseUserRepository courseUserRepository;

    public boolean supports(Class<?> type){
        return Form.class.equals(type);
    }

    public void validate(Object o, Errors errors){
        Form user = (Form) o;
        ValidationUtils.rejectIfEmpty(errors, "confirmPassword", "",
                "");
        if(!user.getPassword().equals(user.getConfirmPassword())){
            errors.rejectValue("confirmPassword", "", "Passwords do not match");
        }
        if(user.getUsername().equals("")){
            return;
        }
        CourseUser courseUser = courseUserRepository.findByUsername(user.getUsername()).orElse(null);
        if(courseUser != null){
            errors.rejectValue("username", "", "User is already in use");
        }
    }

    @Override
    public <T> Set<ConstraintViolation<T>> validate(T t, Class<?>... classes) {
        return Set.of();
    }

    @Override
    public <T> Set<ConstraintViolation<T>> validateProperty(T t, String s, Class<?>... classes) {
        return Set.of();
    }

    @Override
    public <T> Set<ConstraintViolation<T>> validateValue(Class<T> aClass, String s, Object o, Class<?>... classes) {
        return Set.of();
    }

    @Override
    public BeanDescriptor getConstraintsForClass(Class<?> aClass) {
        return null;
    }

    @Override
    public <T> T unwrap(Class<T> aClass) {
        return null;
    }

    @Override
    public ExecutableValidator forExecutables() {
        return null;
    }
}
