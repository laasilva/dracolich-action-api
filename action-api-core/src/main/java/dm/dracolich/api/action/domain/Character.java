package dm.dracolich.api.action.domain;

import dm.dracolich.api.action.enums.ArmorTypeEnum;
import dm.dracolich.api.action.enums.CharacterTypeEnum;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Character {
    private String id;
    private String name;
    private CharacterTypeEnum characterType;
    private Integer level;
    @Builder.Default
    private Set<CharacterClassAssignment> classAssignments = new HashSet<>();
    private Alignment alignment;
    private Traits traits;
    private Race primaryRace;
    private Race secondaryRace;
    private Integer xpPoints;
    private Abilities abilities;
    private Skills skills;
    @Builder.Default
    private Set<Proficiency> proficiencies = new HashSet<>();
    private String otherProficiencies;
    private Integer hitPoints;
    private Integer tempHitPoints;
    private Integer deathSavesSuccesses;
    private Integer deathSavesFailures;
    private Boolean inspiration;
    private ArmorTypeEnum armorProficiency;
    private Integer armorClass;
    private Integer speed;
    private Integer initiative;
    private Integer passiveWisdom;
    @Builder.Default
    private Set<Equipment> equipments = new HashSet<>();
    @Builder.Default
    private Set<Character> allies = new HashSet<>();
    @Builder.Default
    private Set<Character> alliedBy = new HashSet<>();
    @Builder.Default
    private Set<Organization> organizations = new HashSet<>();
}