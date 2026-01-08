package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

/**
 * Represents a character's skill proficiencies and modifiers.
 * <p>
 * Skills are derived from ability scores and represent specific areas
 * of expertise such as Acrobatics (Dexterity), Arcana (Intelligence),
 * or Perception (Wisdom). Each skill value includes the ability modifier
 * plus any proficiency bonus if the character is proficient.
 * </p>
 */
@Entity
@Table(name = "skills")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SkillsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column
    private Integer acrobatics;

    @Column(name = "animal_handling")
    private Integer animalHandling;

    @Column
    private Integer arcana;

    @Column
    private Integer athletics;

    @Column
    private Integer deception;

    @Column
    private Integer history;

    @Column
    private Integer insight;

    @Column
    private Integer intimidation;

    @Column
    private Integer investigation;

    @Column
    private Integer medicine;

    @Column
    private Integer nature;

    @Column
    private Integer perception;

    @Column
    private Integer performance;

    @Column
    private Integer persuasion;

    @Column
    private Integer religion;

    @Column(name = "sleight_of_hand")
    private Integer sleightOfHand;

    @Column
    private Integer stealth;

    @Column
    private Integer survival;
}
