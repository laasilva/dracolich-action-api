package dm.dracolich.api.action.records;

import dm.dracolich.api.action.enums.ArmorTypeEnum;

public record EquipmentDTO(String id,
                           String equipmentName,
                           String equipmentType,
                           ArmorTypeEnum armorType,
                           String equipmentDescription,
                           Boolean active) { }