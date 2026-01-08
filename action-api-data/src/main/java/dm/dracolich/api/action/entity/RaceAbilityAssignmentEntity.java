package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;


@Entity
@Table(name = "race_ability_assignments")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaceAbilityAssignment {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Enumerated(EnumType.STRING)
    @Column(name = "ability_type", nullable = false)
    private AbilityType abilityType;

    @Column(name = "bonus_points", nullable = false)
    private Integer bonusPoints;

    @ManyToOne
    @JoinColumn(name = "race_id", nullable = false)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private Race race;
}