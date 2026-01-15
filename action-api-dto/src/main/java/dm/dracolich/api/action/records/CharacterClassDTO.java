package dm.dracolich.api.action.records;

import dm.dracolich.api.action.enums.DiceTypeEnum;

public record CharacterClassDTO(String id,
                                String className,
                                String background,
                                DiceTypeEnum hitDice,
                                Boolean custom) { }