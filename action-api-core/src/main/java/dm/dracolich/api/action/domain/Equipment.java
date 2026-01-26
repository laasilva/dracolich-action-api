package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.AbilityTypeEnum;
import dm.dracolich.api.action.enums.ArmorTypeEnum;
import dm.dracolich.api.action.enums.DamageTypeEnum;
import dm.dracolich.api.action.enums.SkillTypeEnum;
import lombok.*;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
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
    @Builder.Default
    private Boolean active = false;
    private CoinValue coinValue;
    @Builder.Default
    private Map<DamageTypeEnum, Integer> damageTypes = new HashMap<>();
    @Builder.Default
    private Map<DamageTypeEnum, Integer> damageAdvantages = new HashMap<>();
    @Builder.Default
    private Map<DamageTypeEnum, Integer> damageDisadvantages = new HashMap<>(); // add value
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();
}