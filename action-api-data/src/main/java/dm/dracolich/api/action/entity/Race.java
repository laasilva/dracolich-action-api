package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

/**
 * Represents a character race (e.g., Human, Elf, Dwarf, Orc).
 * <p>
 * Each race provides racial attributes and bonuses that affect
 * character capabilities. Characters can have a primary race and
 * optionally a secondary race (half-breeds).
 * </p>
 */
@Entity
@Table(name = "races")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Race {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "race_name")
    private String raceName;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "race_attributes",
            joinColumns = @JoinColumn(name = "race_id"),
            inverseJoinColumns = @JoinColumn(name = "attribute_id")
    )
    @Builder.Default
    private Set<Attribute> attributes = new HashSet<>();
}
