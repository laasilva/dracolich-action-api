package dm.dracolich.api.action.validator;

import dm.dracolich.api.action.domain.Character;
import dm.dracolich.api.action.enums.AbilityTypeEnum;
import dm.dracolich.api.action.enums.ArmorTypeEnum;
import dm.dracolich.api.action.error.DmdError;
import dm.dracolich.api.action.repository.AlignmentRepository;
import dm.dracolich.api.action.repository.CharacterRepository;
import dm.dracolich.api.action.repository.RaceRepository;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.apache.commons.collections.CollectionUtils;

import java.util.HashSet;
import java.util.Set;

import static dm.dracolich.api.action.error.ErrorCodes.*;

public class CharacterValidator implements ConstraintValidator<IsCharacterValid, Character> {
    private Set<DmdError> errors;

    private ClassAssignmentValidator classAssignmentValidator;

    /* repositories **/
    private AlignmentRepository alignmentRepository;
    private CharacterRepository characterRepository;
    private RaceRepository raceRepository;

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
            return false;
        }

        // validate class assignments
        classAssignmentValidator.isValid(character.getClassAssignments(), character.getLevel(), errors);


        // alignment cannot be null
        if(character.getAlignment() == null) {
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("alignment")));
            return false;
        }

        // alignment cannot be different from alignment values present in the database
        if(!alignmentRepository.existsByAlignmentName(character.getAlignment().getAlignmentName()))
            errors.add(DmdError.build(DMD006.getCode(),
                    DMD006.format(character.getAlignment().getAlignmentName(), "alignment")));


        // primary race is required, secondary race is optional
        if(character.getPrimaryRace() == null) {
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("primaryRace")));
        } else {
            var primaryRace = raceRepository.findById(character.getPrimaryRace().getId());

            if(primaryRace.isEmpty())
                errors.add(DmdError.build(DMD006.getCode(),
                        DMD006.format(character.getPrimaryRace().getRaceName(), "primaryRace")));
        }

        // secondary race cannot be the same as primary race
        if(character.getSecondaryRace() != null) {
            var secondaryRace = raceRepository.findById(character.getSecondaryRace().getId());

            if(secondaryRace.isEmpty())
                errors.add(DmdError.build(DMD006.getCode(),
                        DMD006.format(character.getSecondaryRace().getRaceName(), "secondaryRace")));

            if(character.getSecondaryRace().equals(character.getPrimaryRace()))
                errors.add(DmdError.build(DMD006.getCode(),
                        DMD006.format(character.getSecondaryRace().getRaceName(), "secondaryRace")));
        }

        // xp points cannot be null, if null, set to 0
        if(character.getXpPoints() == null)
            character.setXpPoints(0);

        // validates if skills are not null
        if(character.getSkills() == null)
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("skills")));

        // validates if abilities are not null
        if(character.getAbilities() == null)
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("abilities")));

        // validates if proficiencies are not null
        if(character.getProficiencies() == null)
            errors.add(DmdError.build(DMD003.getCode(), DMD003.format("proficiencies")));

        // validates proficiencies versus character level (can have +1 each level)
        if(character.getLevel() + 1 < character.getProficiencies().size())
            errors.add(DmdError.build(DMD008.getCode(), DMD008.format("proficiencies",
                    String.valueOf(character.getLevel() + 1))));

        // validates armor proficiency
        if(character.getArmorProficiency() == null)
            character.setArmorProficiency(ArmorTypeEnum.NOT_PROFICIENT);

        // validates and sets initial passive wisdom
        if(character.getPassiveWisdom() == null) {
            character.setPassiveWisdom(10 + character.getAbilities().getWisdom());

            character.getProficiencies().forEach(proficiency -> {
                if(proficiency.getProficiencyName().equals(AbilityTypeEnum.WISDOM))
                    character.setPassiveWisdom(character.getPassiveWisdom() + proficiency.getProficiencyBonus());
            });
        }

        if(CollectionUtils.isNotEmpty(character.getAllies())) {
            character.getAllies().forEach(ally -> {
                var entity = characterRepository.findById(ally.getId());

                if(entity.isEmpty())
                    errors.add(DmdError.build(DMD009.getCode(),
                            DMD009.format(ally.getId(), "ally"))); // TODO: change to find by username
            });
        }

        if(CollectionUtils.isNotEmpty(character.getAlliedBy())) {
            character.getAlliedBy().forEach(ally -> {
                var entity = characterRepository.findById(ally.getId());

                if(entity.isEmpty())
                    errors.add(DmdError.build(DMD009.getCode(),
                            DMD009.format(ally.getId(), "ally"))); // TODO: change to find by username
            });
        }

        character.getPrimaryRace().getAttributes().forEach(attribute -> {
            if(attribute.getAttributePoints() == null || attribute.getAttributePoints().equals(0))
                attribute.setAttributePoints(1);
        });

        character.getPrimaryRace().getRaceAbilities().forEach(ability -> {
            if(ability.getBonusPoints() == null || ability.getBonusPoints().equals(0))
                ability.setBonusPoints(1);
        });

        if(CollectionUtils.isNotEmpty(character.getEquipments())) {
            character.getEquipments().forEach(equipment -> {
               if(equipment.getEquipmentName() == null)
                   errors.add(DmdError.build(DMD003.getCode(),
                           DMD003.format("equipmentName")));

               if(equipment.getEquipmentType() == null) {
                   errors.add(DmdError.build(DMD003.getCode(),
                           DMD003.format("equipmentType")));
               } else {
                   if(equipment.getEquipmentType().equals("ARMOR") && equipment.getArmorType() == null)
                       errors.add(DmdError.build(DMD003.getCode(),
                               DMD003.format("armorType")));
               }

               if(equipment.getAbilityType() != null && equipment.getAbilityBonus() == null)
                   errors.add(DmdError.build(DMD003.getCode(),
                           DMD003.format("abilityBonus")));

               if(equipment.getSkillType() != null && equipment.getSkillBonus() == null)
                   errors.add(DmdError.build(DMD003.getCode(),
                           DMD003.format("skillBonus")));

               if(equipment.getCoinValue() == null)
                   errors.add(DmdError.build(DMD003.getCode(),
                           DMD003.format("coinValue")));
            });
        }


        return true;
    }
}
