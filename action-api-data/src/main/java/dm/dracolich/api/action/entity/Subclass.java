package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Set;

/**
 * Represents a subclass specialization for a character class.
 * <p>
 * Subclasses provide additional features and abilities that further
 * define a character's role (e.g., Berserker for Barbarian, Evocation for Wizard).
 * Characters typically choose a subclass at a specific level.
 * </p>
 */
@Entity
@Table(name = "subclasses")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Subclass {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "subclass_name", unique = true)
    private String name;

    @Column(name = "subclass_description", columnDefinition = "TEXT")
    private String description;

    @ManyToOne
    @JoinColumn(name = "class_id")
    private CharacterClass characterClass;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "subclass_attributes",
            joinColumns = @JoinColumn(name = "subclass_id"),
            inverseJoinColumns = @JoinColumn(name = "attribute_id")
    )
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();

}
