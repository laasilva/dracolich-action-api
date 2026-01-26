package dm.dracolich.api.action.validator;

import dm.dracolich.api.action.domain.CharacterClass;
import dm.dracolich.api.action.error.DmdError;
import dm.dracolich.api.action.repository.CharacterClassRepository;
import lombok.RequiredArgsConstructor;

import java.util.Set;

import static dm.dracolich.api.action.error.ErrorCodes.*;

@RequiredArgsConstructor
public class ClassValidation {
    private final CharacterClassRepository characterClassRepository;

    public void isValid(CharacterClass characterClass, Set<DmdError> errors) {
        // character class cannot be null
        if(characterClass == null) {
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("characterClass")));
            return ;
        }

        // character class cannot be different from character class values present in the database
        if(!characterClassRepository.existsByClassName(characterClass.getClassName()))
            errors.add(DmdError.build(DMD006.getCode(),
                    DMD006.format(characterClass.getClassName(), "characterClass")));

        characterClass.getAttributes().forEach(attribute -> {
            if(attribute.getAttributePoints() == null || attribute.getAttributePoints().equals(0))
                attribute.setAttributePoints(1);
        });
    }
}
