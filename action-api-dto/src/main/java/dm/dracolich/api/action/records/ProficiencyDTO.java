package dm.dracolich.api.action.records;

import dm.dracolich.api.action.enums.AbilityTypeEnum;

public record ProficiencyDTO(AbilityTypeEnum abilityType,
        Integer proficiencyBonus) { }
