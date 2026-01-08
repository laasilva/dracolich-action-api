package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Represents a proficiency that a character can possess.
 * <p>
 * Proficiencies include weapon proficiencies, armor proficiencies,
 * tool proficiencies, and language proficiencies. Each proficiency
 * may provide a bonus when performing related actions.
 * </p>
 */
@Entity
@Table(name = "proficiencies")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProficiencyEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "proficiency_name")
    private AbilityTypeEntityEnum proficiencyName;

    @Column(name = "proficiency_bonus")
    private Integer proficiencyBonus;
}
