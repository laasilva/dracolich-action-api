package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

/**
 * Represents an attack action or spell that a character can perform.
 * <p>
 * This entity stores information about weapons, cantrips, or spells
 * that deal damage, including the attack bonus modifier and the
 * types of damage dealt (e.g., slashing, fire, necrotic).
 * </p>
 */
@Entity
@Table(name = "attacks_and_spell_castings")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttackAndSpellCasting {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "attack_bonus")
    private String attackBonus;

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "attack_damage_types", joinColumns = @JoinColumn(name = "attack_id"))
    @Column(name = "damage_type")
    private Set<DamageType> damageTypes = new HashSet<>();
}
