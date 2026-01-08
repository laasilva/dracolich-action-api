package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Represents the six core ability scores for a character.
 * <p>
 * Ability scores define the character's fundamental capabilities:
 * Strength, Dexterity, Constitution, Intelligence, Wisdom, and Charisma.
 * These scores influence skill checks, saving throws, and combat effectiveness.
 * </p>
 */
@Entity
@Table(name = "abilities")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AbilitiesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "strength")
    private Integer strength;

    @Column(name = "dexterity")
    private Integer dexterity;

    @Column(name = "constitution")
    private Integer constitution;

    @Column(name = "intelligence")
    private Integer intelligence;

    @Column(name = "wisdom")
    private Integer wisdom;

    @Column(name = "charisma")
    private Integer charisma;
}
