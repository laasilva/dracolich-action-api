package dm.dracolich.api.action;

import dm.dracolich.api.action.enums.ArmorTypeEnum;
import dm.dracolich.api.action.enums.CharacterTypeEnum;
import dm.dracolich.api.action.records.*;

import java.util.List;

public record CharacterDTO(
        String id,
        String name,
        CharacterTypeEnum characterType,
        Integer level,
        List<CharacterClassAssignmentDTO> classAssignments,
        AlignmentDTO alignment,
        TraitsDTO traits,
        RaceDTO primaryRace,
        RaceDTO secondaryRace,
        Integer xpPoints,
        AbilitiesDTO abilities,
        SkillsDTO skills,
        List<ProficiencyDTO> proficiencies,
        String otherProficiencies,
        Integer hitPoints,
        Integer tempHitPoints,
        Integer deathSavesSuccesses,
        Integer deathSavesFailures,
        Boolean inspiration,
        ArmorTypeEnum armorProficiency,
        Integer armorClass,
        Integer speed,
        Integer initiative,
        Integer passiveWisdom,
        List<EquipmentDTO> equipments,
        List<String> allyIds,
        List<OrganizationDTO> organizations) { }