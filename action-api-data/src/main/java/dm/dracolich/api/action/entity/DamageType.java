package dm.dracolich.api.action.entity;

import lombok.Getter;

/**
 * Enumeration of damage types in the game system.
 * <p>
 * Damage types determine how attacks interact with resistances,
 * vulnerabilities, and immunities. Physical types include Bludgeoning,
 * Piercing, and Slashing. Elemental types include Fire, Cold, Lightning,
 * Acid, Thunder, and Poison. Magical types include Force, Necrotic,
 * Radiant, and Psychic.
 * </p>
 */
@Getter
public enum DamageType {
    FIRE("FIRE"),
    ACID("ACID"),
    BLUDGEONING("BLUDGEONING"),
    COLD("COLD"),
    FORCE("FORCE"),
    LIGHTNING("LIGHTNING"),
    NECROTIC("NECROTIC"),
    PIERCING("PIERCING"),
    POISON("POISON"),
    PSYCHIC("PSYCHIC"),
    RADIANT("RADIANT"),
    SLASHING("SLASHING"),
    THUNDER("THUNDER");

    private String name;

    DamageType(String name) {
        this.name = name;
    }
}