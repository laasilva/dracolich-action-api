package dm.dracolich.api.action.validator;

import dm.dracolich.api.action.domain.Character;
import dm.dracolich.api.action.error.DmdError;
import dm.dracolich.api.action.repository.AlignmentRepository;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.HashSet;
import java.util.Set;

import static dm.dracolich.api.action.error.ErrorCodes.*;

public class CharacterValidator implements ConstraintValidator<IsCharacterValid, Character> {
    private Set<DmdError> errors;

    private ClassAssignmentValidator classAssignmentValidator;

    /* repositories **/
    private AlignmentRepository alignmentRepository;

    @Override
    public void initialize(IsCharacterValid constraintAnnotation) {
        this.errors = new HashSet<>();

        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(Character character, ConstraintValidatorContext context) {
        // character object cannot be null
        if(character == null)
            return false;

        // character name cannot be null or empty
        if(character.getName() == null || character.getName().trim().isEmpty())
            return false;

        // character level cannot be null, if null, set to 1
        if(character.getLevel() == null)
            character.setLevel(1);

        // character type cannot be null
        if(character.getCharacterType() == null)
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("characterType")));

        // class assignments cannot be null or empty
        if(character.getClassAssignments() == null || character.getClassAssignments().isEmpty()) {
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("classAssignments")));
        } else {
            classAssignmentValidator.isValid(character.getClassAssignments(), character.getLevel(), errors);
        }

        // alignment cannot be null
        if(character.getAlignment() == null) {
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("alignment")));
        } else {
            // alignment cannot be different from alignment values present in the database
            if(!alignmentRepository.existsByAlignmentName(character.getAlignment().getAlignmentName()))
                errors.add(DmdError.build(DMD006.getCode(),
                        DMD006.format(character.getAlignment().getAlignmentName(), "alignment")));
        }

        // primary race is required, secondary race is optional
        if(character.getPrimaryRace() == null)
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("primaryRace")));

        // xp points cannot be null, if null, set to 0
        if(character.getXpPoints() == null)
            character.setXpPoints(0);


        return true;
    }
}
