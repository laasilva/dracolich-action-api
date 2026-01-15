package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.AbilityTypeEnum;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Proficiency {
    private String id;
    private AbilityTypeEnum proficiencyName;
    private Integer proficiencyBonus;
}