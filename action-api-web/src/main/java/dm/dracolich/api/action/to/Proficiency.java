package dm.dracolich.api.action.to;

import com.fasterxml.jackson.annotation.JsonIgnore;
import dm.dracolich.api.action.entity.AbilityTypeEntityEnum;

public record Proficiency(AbilityTypeEntityEnum abilityType, @JsonIgnore Integer proficiencyBonus) {
}
