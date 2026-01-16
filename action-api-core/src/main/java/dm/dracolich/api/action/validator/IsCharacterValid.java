package dm.dracolich.api.action.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = { CharacterValidator.class })
public @interface IsCharacterValid {
    String message() default "Character is not valid";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
