package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "spellcastings")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SpellcastingEntity {
    //only allowed for characters that have spellcasting abilities (be cantrips or casters)
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @OneToOne
    @JoinColumn(name = "spell_id")
    private SpellEntity spell;

    @Enumerated(EnumType.STRING)
    @Column(name = "spellcasting_class")
    private SpellcastingClassTypeEntityEnum spellCastingClassType;

    @Column(name = "spellcasting_ability")
    private String spellCastingAbility; // the ability used to cast spells - intelligence, wisdom, or charisma

    @Column(name = "spellcasting_save_dc")
    private Integer spellSaveDC; // spell save difficulty class, 8 + prof bonus + spellcasting ability modifier

    @Column(name = "spellcasting_attack_bonus")
    private Integer spellAttackBonus; // spell attack bonus, 5 + prof bonus + spellcasting ability modifier

    @Column(name = "spell_level")
    private Integer spellLevel; // spell level - equal to the character level

    @Column(name = "spellcasting_total_slots")
    private Integer spellTotalSlots; // spell slots, increases per level

    @Column(name = "spellcasting_expended_slots")
    private Integer expendedSlots; // expended slots per rest, cannot exceed total slots until it's restored


}
