package dm.dracolich.api.action.records;

import dm.dracolich.api.action.enums.AlignmentEnum;
import dm.dracolich.api.action.enums.CharacterTypeEnum;
import dm.dracolich.api.action.enums.ClassEnum;
import dm.dracolich.api.action.enums.RaceEnum;

import java.util.Set;

public record CreateCharacterDTO(String name,
                                 CharacterTypeEnum characterType,
                                 Integer level,
                                 ClassEnum characterClass,
                                 AlignmentEnum alignment,
                                 RaceEnum primaryRaceId,
                                 RaceEnum secondaryRaceId,
                                 TraitsDTO traits,
                                 AbilitiesDTO abilities,
                                 SkillsDTO skills,
                                 Set<ProficiencyDTO> proficiencies,
                                 String otherProficiencies,
                                 Set<String> equipmentIds,
                                 Set<String> allyIds,
                                 Set<String> organizationIds) {}