package dm.dracolich.api.action.request;

import dm.dracolich.api.action.to.*;

import java.util.Set;

public record CreateCharacterRequest(String name,
                                     CharacterTypeEnum characterType,
                                     Integer level,
                                     ClassEnum characterClass,
                                     AlignmentEnum alignment,
                                     RaceEnum primaryRaceId,
                                     RaceEnum secondaryRaceId,
                                     Traits traits,
                                     Abilities abilities,
                                     Skills skills,
                                     Set<Proficiency> proficiencies,
                                     String otherProficiencies,
                                     Set<String> equipmentIds,
                                     Set<String> allyIds,
                                     Set<String> organizationIds) {}