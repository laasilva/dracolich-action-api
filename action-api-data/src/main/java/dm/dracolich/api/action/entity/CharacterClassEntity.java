package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

/**
 * Represents a character class (e.g., Warrior, Mage, Rogue).
 * <p>
 * Each class defines a set of attributes and abilities that characters
 * can gain when assigned to this class.
 * </p>
 */
@Entity
@Table(name = "classes")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CharacterClass {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "class_name", unique = true)
    private String className;

    @OneToMany(mappedBy = "characterClass", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private Set<Subclass> subclasses = new HashSet<>();

    @Column(name = "background")
    private String background; // character background - different for each class

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "class_attributes",
            joinColumns = @JoinColumn(name = "character_class_id"),
            inverseJoinColumns = @JoinColumn(name = "attribute_id")
    )
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();

    @Column(name = "hit_dice")
    private DiceType hitDice; // dice to be rolled for hit points

    @Column(name = "custom", columnDefinition = "BOOLEAN DEFAULT FALSE")
    private Boolean custom;

}
