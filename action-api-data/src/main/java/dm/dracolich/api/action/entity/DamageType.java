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
    FIRE,
    ACID,
    BLUDGEONING,
    COLD,
    FORCE,
    LIGHTNING,
    NECROTIC,
    PIERCING,
    POISON,
    PSYCHIC,
    RADIANT,
    SLASHING,
    THUNDER;
}