package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
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
public class Equipment {
    /**
     * wearable items - armor, weapons, etc.
     * consumable items - potions, scrolls, etc.
     * tools - scrolls, ropes, barrels, etc.
     * pouch - then it should only have coin values
     */
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "equipment_name")
    private String equipmentName;

    @Column(name = "armor_class")
    private Integer armorClass;

    @Column(name = "equipment_type")
    private String equipmentType;

    @Column(name = "stealth_advantage")
    private Boolean stealthAdvantage;

    @Column(name = "equipment_value")
    private String equipmentDescription;

    @Column(name = "active")
    private Boolean active;

    @OneToOne
    @JoinColumn(name = "coin_value_id")
    private CoinValue coinValue;

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "equipment_damage_types", joinColumns = @JoinColumn(name = "equipment_id"))
    @Column(name = "damage_type")
    private Set<DamageType> damageTypes = new HashSet<>(); // causes these damage types

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "equipment_damage_advantages", joinColumns = @JoinColumn(name = "equipment_id"))
    @Column(name = "damage_type")
    private Set<DamageType> damageAdvantages = new HashSet<>(); // has advantage against these damage type

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "equipment_damage_disadvantages", joinColumns = @JoinColumn(name = "equipment_id"))
    @Column(name = "damage_type")
    private Set<DamageType> damageDisadvantages = new HashSet<>(); // has disadvantage against these damage type

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "equipment_attributes",
            joinColumns = @JoinColumn(name = "equipment_id"),
            inverseJoinColumns = @JoinColumn(name = "attribute_id")
    )
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();
}
