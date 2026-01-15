package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.SpellcastingClassTypeEnum;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Spellcasting {
    private String id;
    private Spell spell;
    private SpellcastingClassTypeEnum spellCastingClassType;
    private String spellCastingAbility;
    private Integer spellSaveDC;
    private Integer spellAttackBonus;
    private Integer spellLevel;
    private Integer spellTotalSlots;
    private Integer expendedSlots;
}