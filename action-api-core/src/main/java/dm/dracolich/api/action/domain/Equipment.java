package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.AbilityTypeEnum;
import dm.dracolich.api.action.enums.ArmorTypeEnum;
import dm.dracolich.api.action.enums.DamageTypeEnum;
import dm.dracolich.api.action.enums.SkillTypeEnum;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Equipment {
    private String id;
    private String equipmentName;
    private String equipmentType;
    private ArmorTypeEnum armorType;
    private AbilityTypeEnum abilityType;
    private Integer abilityBonus;
    private SkillTypeEnum skillType;
    private Integer skillBonus;
    private String equipmentDescription;
    private Boolean active;
    private CoinValue coinValue;
    @Builder.Default
    private Set<DamageTypeEnum> damageTypes = new HashSet<>();
    @Builder.Default
    private Set<DamageTypeEnum> damageAdvantages = new HashSet<>();
    @Builder.Default
    private Set<DamageTypeEnum> damageDisadvantages = new HashSet<>();
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();
}