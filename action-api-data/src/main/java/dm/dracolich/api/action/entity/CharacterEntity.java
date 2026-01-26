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
public class CharacterEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "character_name")
    private String name;

    @Column(name = "character_type")
    @Builder.Default
    private CharacterTypeEntityEnum characterType = CharacterTypeEntityEnum.PLAYER;

    @Column(name = "level")
    @Builder.Default
    private Integer level = 1; // current character level

    @OneToMany(mappedBy = "character", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private Set<CharacterClassAssignmentEntity> classAssignments = new HashSet<>();

    @OneToOne
    @JoinColumn(name = "alignment_id")
    private AlignmentEntity alignment;

    @OneToOne
    @JoinColumn(name = "trait_id")
    private TraitsEntity traits; // character personality traits

    @ManyToOne(optional = false)
    @JoinColumn(name = "primary_race_id", nullable = false)
    private RaceEntity primaryRace;

    @ManyToOne  // optional (for half-breeds)
    @JoinColumn(name = "secondary_race_id")
    private RaceEntity secondaryRace;

    @Column(name = "xp_points")
    private Integer xpPoints; // total experience points

    @OneToOne
    @JoinColumn(name = "ability_id")
    private AbilitiesEntity abilities;

    @OneToOne
    @JoinColumn(name = "skills_id")
    private SkillsEntity skills;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "character_proficiencies",
            joinColumns = @JoinColumn(name = "character_id"),
            inverseJoinColumns = @JoinColumn(name = "proficiency_id")
    )
    @Builder.Default
    private Set<ProficiencyEntity> proficiencies = new HashSet<>();

    @Column(name = "other_proficiencies", columnDefinition = "TEXT")
    private String otherProficiencies;

    @Column(name = "hit_points")
    private Integer hitPoints; // current hit points

    @Column(name = "temp_hit_points")
    private Integer tempHitPoints; // temporary hit points

    /* total of 6 death throws after hitting 0 hit points, 3 successes and 3 failures
     * if 3 failures, character DEATH is permanent!
     */
    @Column(name = "death_saves_successes")
    @Builder.Default
    private Integer deathSavesSuccesses = 0;

    @Column(name = "death_saves_failures")
    @Builder.Default
    private Integer deathSavesFailures = 0;

    @Column(name = "inspiration")
    @Builder.Default
    private Boolean inspiration = false; // can be used for advantage rolls or give it to other characters

    @Column(name = "armor_proficiency")
    private ArmorTypeEntityEnum armorProficiency; // armor proficiency

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
    private Set<EquipmentEntity> equipments = new HashSet<>(); // character equipments - can only wear (active) one piece of armor of each type

    @ManyToMany
    @JoinTable(
            name = "character_allies",
            joinColumns = @JoinColumn(name = "character_id"),
            inverseJoinColumns = @JoinColumn(name = "ally_id")
    )
    @Builder.Default
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private Set<CharacterEntity> allies = new HashSet<>(); // characters this character considers allies

    @ManyToMany(mappedBy = "allies")
    @Builder.Default
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private Set<CharacterEntity> alliedBy = new HashSet<>(); // characters who consider this character an ally

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinTable(
            name = "character_organizations",
            joinColumns = @JoinColumn(name = "character_id"),
            inverseJoinColumns = @JoinColumn(name = "organization_id")
    )
    @Builder.Default
    private Set<OrganizationEntity> organizations = new HashSet<>(); // organizations this character is a member of
}
