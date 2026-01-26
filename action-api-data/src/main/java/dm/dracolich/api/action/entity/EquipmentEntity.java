package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Represents an item that a character can own or equip.
 * <p>
 * Equipment includes wearable items (armor, weapons), consumable items
 * (potions, scrolls), tools (ropes, barrels), and pouches (for currency).
 * Equipment can provide armor class bonuses, affect stealth, deal or
 * resist specific damage types, and grant attribute modifiers.
 * </p>
 */
@Entity
@Table(name = "equipments")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EquipmentEntity {
    /**
     * wearable items - armor, weapons, etc.
     * consumable items - potions, scrolls, etc.
     * tools - scrolls, ropes, barrels, etc.
     * pouch - then it should only have coin values
     */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "equipment_name", unique = true)
    private String equipmentName;

    @Column(name = "equipment_type")
    private String equipmentType;

    @Column(name = "armor_type")
    private ArmorTypeEntityEnum armorType;

    @Column(name = "ability_type")
    private AbilityTypeEntityEnum abilityType;

    @Column(name = "ability_bonus")
    private Integer abilityBonus;

    @Column(name = "skill_type")
    private SkillTypeEntityEnum skillType;

    @Column(name = "skill_bonus")
    private Integer skillBonus;

    @Column(name = "equipment_value")
    private String equipmentDescription;

    @Column(name = "active")
    private Boolean active;

    @OneToOne
    @JoinColumn(name = "coin_value_id")
    private CoinValueEntity coinValue;

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "equipment_damage_types", joinColumns = @JoinColumn(name = "equipment_id"))
    @Column(name = "damage_type")
    private Map<DamageTypeEntityEnum, Integer> damageTypes = new HashMap<>(); // causes these damage types

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "equipment_damage_advantages", joinColumns = @JoinColumn(name = "equipment_id"))
    @Column(name = "damage_type")
    private Map<DamageTypeEntityEnum, Integer> damageAdvantages = new HashMap<>(); // has advantage against these damage type

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "equipment_damage_disadvantages", joinColumns = @JoinColumn(name = "equipment_id"))
    @Column(name = "damage_type")
    private Map<DamageTypeEntityEnum, Integer> damageDisadvantages = new HashMap<>(); // has disadvantage against these damage type

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "equipment_attributes",
            joinColumns = @JoinColumn(name = "equipment_id"),
            inverseJoinColumns = @JoinColumn(name = "attribute_id")
    )
    @Builder.Default
    private Set<AttributeEntity> attributes = new HashSet<>();
}
