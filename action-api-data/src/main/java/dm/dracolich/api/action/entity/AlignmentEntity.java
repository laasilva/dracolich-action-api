package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Represents a character's moral and ethical alignment.
 * <p>
 * Alignment describes a character's moral compass along two axes:
 * lawful-chaotic (attitude toward society and order) and good-evil
 * (attitude toward others' welfare). Examples include Lawful Good,
 * Chaotic Neutral, and True Neutral.
 * </p>
 */
@Entity
@Table(name = "alignments", uniqueConstraints = {
        @UniqueConstraint(columnNames = "alignment_name")
})
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AlignmentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "alignment_name", unique = true)
    private String alignmentName;

    @Column(name = "alignment_description")
    private String alignmentDescription;
}
