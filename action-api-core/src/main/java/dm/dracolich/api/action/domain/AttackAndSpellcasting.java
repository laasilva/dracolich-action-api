package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.DamageTypeEnum;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttackAndSpellcasting {
    private String id;
    private String name;
    private String attackBonus;
    @Builder.Default
    private Set<DamageTypeEnum> damageTypes = new HashSet<>();
}