package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.DamageTypeEnum;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Spell {
    private String id;
    private String spellName;
    private Integer minSlotLevel;
    @Builder.Default
    private Set<DamageTypeEnum> damageTypes = new HashSet<>();
}