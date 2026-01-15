package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.AbilityTypeEnum;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaceAbilityAssignment {
    private String id;
    private AbilityTypeEnum abilityType;
    private Integer bonusPoints;
}