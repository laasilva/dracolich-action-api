package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "spells")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Spell {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "spell_name")
    private String spellName;

    @Column(name = "min_slot_level")
    private Integer minSlotLevel; // the minimal slot the spell can be cast at

    @ElementCollection
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "spell_damage_types", joinColumns = @JoinColumn(name = "spell_id"))
    @Column(name = "damage_type")
    private Set<DamageType> damageTypes = new HashSet<>(); // causes these damage types
}
