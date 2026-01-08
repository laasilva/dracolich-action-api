package dm.dracolich.api.action.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

/**
 * Represents a player character in the game.
 * <p>
 * A character has attributes, classes, races, equipment, and various stats
 * that define their capabilities in the game world.
 * </p>
 */
@Entity
@Table(name = "characters")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Character {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "character_name")
    private String name;

    @Column(name = "character_type")
    private CharacterType characterType;

    @Column(name = "level")
    private Integer level; // current character level

    @OneToMany(mappedBy = "character", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private Set<CharacterClassAssignment> classAssignments = new HashSet<>();

    @OneToOne
    @JoinColumn(name = "trait_id")
    private Traits traits; // character personality traits

    @ManyToOne(optional = false)
    @JoinColumn(name = "primary_race_id", nullable = false)
    private Race primaryRace;

    @ManyToOne  // optional (for half-breeds)
    @JoinColumn(name = "secondary_race_id")
    private Race secondaryRace;

    @Column(name = "xp_points")
    private Integer xpPoints; // total experience points

    @OneToOne
    @JoinColumn(name = "ability_id")
    private Abilities abilities;

    @OneToOne
    @JoinColumn(name = "saving_throw_id")
    private Abilities savingThrows;

    @OneToOne
    @JoinColumn(name = "proficiency_id")
    private Skills skills;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "character_proficiencies",
            joinColumns = @JoinColumn(name = "character_id"),
            inverseJoinColumns = @JoinColumn(name = "proficiency_id")
    )
    @Builder.Default
    private Set<Proficiency> otherProficiencies = new HashSet<>(); // optional, if character has other proficiencies or speaks any languages

    @Column(name = "hit_dice")
    private Integer hitDice; // dice to be rolled for hit points

    @Column(name = "hit_points")
    private Integer hitPoints; // current hit points

    @Column(name = "temp_hit_points")
    private Integer tempHitPoints; // temporary hit points

    /* total of 6 death throws after hitting 0 hit points, 3 successes and 3 failures
     * if 3 failures, character DEATH is permanent!
     */
    @Column(name = "death_saves_successes")
    private String deathSavesSuccesses;

    @Column(name = "death_saves_failures")
    private String deathSavesFailures;

    @Column(name = "inspiration")
    private Boolean inspiration; // can be used for advantage rolls or give it to other characters

    @Column(name = "proficiency_bonus")
    private Integer proficiencyBonus; // total proficiency bonus

    @Column(name = "armor_class")
    private Integer armorClass; // total armor class

    @Column(name = "speed")
    private Integer speed; // total speed

    @Column(name = "initiative")
    private Integer initiative; // total initiative

    @Column(name = "passive_wisdom")
    private Integer passiveWisdom; // total passive wisdom (perception)

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "character_equipments",
            joinColumns = @JoinColumn(name = "character_id"),
            inverseJoinColumns = @JoinColumn(name = "equipment_id")
    )
    @Builder.Default
    private Set<Equipment> equipments = new HashSet<>(); // character equipments - can only wear (active) one piece of armor of each type

    @ManyToMany
    @JoinTable(
            name = "character_allies",
            joinColumns = @JoinColumn(name = "character_id"),
            inverseJoinColumns = @JoinColumn(name = "ally_id")
    )
    @Builder.Default
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private Set<Character> allies = new HashSet<>(); // characters this character considers allies

    @ManyToMany(mappedBy = "allies")
    @Builder.Default
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private Set<Character> alliedBy = new HashSet<>(); // characters who consider this character an ally

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "character_organizations",
            joinColumns = @JoinColumn(name = "character_id"),
            inverseJoinColumns = @JoinColumn(name = "organization_id")
    )
    @Builder.Default
    private Set<Organization> organizations = new HashSet<>(); // organizations this character is a member of
}
