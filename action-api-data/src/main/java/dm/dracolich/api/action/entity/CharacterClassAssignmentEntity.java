package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Represents the assignment of a character to a class with a specific level.
 * <p>
 * This is a join entity that allows characters to have multiple classes
 * (multiclassing) with independent levels for each class.
 * </p>
 */
@Entity
@Table(name = "character_class_assignments")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CharacterClassAssignmentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @ManyToOne
    @JoinColumn(name = "character_id")
    private CharacterEntity character;

    @ManyToOne
    @JoinColumn(name = "class_id")
    private CharacterClassEntity characterClass;

    @ManyToOne
    @JoinColumn(name = "subclass_id")
    private SubclassEntity subclass; // optional - chosen at specific level (usually 3)

    @Column(name = "level")
    private Integer level;
}
