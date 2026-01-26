package dm.dracolich.api.action.validator;

import dm.dracolich.api.action.domain.CharacterClassAssignment;
import dm.dracolich.api.action.error.DmdError;
import dm.dracolich.api.action.repository.SubclassRepository;
import lombok.RequiredArgsConstructor;

import java.util.Set;

import static dm.dracolich.api.action.error.ErrorCodes.*;

@RequiredArgsConstructor
public class ClassAssignmentValidator {
    private final ClassValidation classValidation;

    private final SubclassRepository subclassRepository;

    public void isValid(Set<CharacterClassAssignment> classAssignments, int level, Set<DmdError> errors) {
        // class assignments cannot be null or empty
        if(classAssignments == null || classAssignments.isEmpty()) {
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("classAssignments")));
            return ;
        }

        classAssignments.stream()
                .filter(ca -> ca.getLevel() == null)
                .forEach(ca -> ca.setLevel(classAssignments.size() == 1 ? level : 1));

        // multiclass is only allowed if level is >= 3
        if(classAssignments.size() > 1 && level < 3)
            errors.add(DmdError.build(DMD004.getCode(), DMD004.format(String.valueOf(level), "3")));

        // only one class can be added by level and the sum of both class levels cannot be greater than the character level
        if(level >= 3 && classAssignments.size() > level - 1) {
            errors.add(DmdError.build(DMD005.getCode(), DMD005.format(String.valueOf(level),
                    String.valueOf(level - 1))));
        }

        int totalClassLevels = classAssignments.stream()
                .mapToInt(CharacterClassAssignment::getLevel)
            .sum();

        if (totalClassLevels != level) {
            errors.add(DmdError.build(DMD007.getCode(),
                    DMD007.format(String.valueOf(totalClassLevels), String.valueOf(level))));
        }

        classAssignments.forEach(classAssignment -> {
            classValidation.isValid(classAssignment.getCharacterClass(), errors);

            // subclass cannot be null
            if(classAssignment.getSubclass() == null) {
                errors.add(DmdError.build(DMD003.getCode(), DMD003.format("subclass")));
                return ;
            }

            // subclass cannot be different from subclass values present in the database
            if(!subclassRepository.existsByName(classAssignment.getSubclass().getName()))
                errors.add(DmdError.build(DMD006.getCode(),
                        DMD006.format(classAssignment.getSubclass().getName(), "subclass")));

            // if class level is null, default to 1
            if(classAssignment.getLevel() == null)
                classAssignment.setLevel(level);

            // class level cannot be greater than character level
            if(classAssignment.getLevel() > level)
                errors.add(DmdError.build(DMD004.getCode(), DMD004.format(String.valueOf(level),
                        String.valueOf(level))));
        });

    }
}
