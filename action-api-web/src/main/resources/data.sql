-- Initial seed data for classes and subclasses
-- Uses ON CONFLICT DO NOTHING to skip if already exists (by name)

-- ==================== ATTRIBUTES ====================
INSERT INTO attributes(id, attribute_name, attribute_points) VALUES
    (gen_random_uuid(), 'Celestial Resistance', 1),
    (gen_random_uuid(), 'Darkvision', 1),
    (gen_random_uuid(), 'Healing Hands', 1),
    (gen_random_uuid(), 'Light Bearer', 1),
    (gen_random_uuid(), 'Celestial Revelation', 1),
    (gen_random_uuid(), 'Dragon Ancestry', 1),
    (gen_random_uuid(), 'Breath Weapon', 1),
    (gen_random_uuid(), 'Damage Resistance', 1),
    (gen_random_uuid(), 'Flight', 1),
    (gen_random_uuid(), 'Dwarven Resilience', 1),
    (gen_random_uuid(), 'Dwarven Toughness', 1),
    (gen_random_uuid(), 'Stonecunning', 1),
    (gen_random_uuid(), 'Elven Lineage', 1),
    (gen_random_uuid(), 'Fey Ancestry', 1),
    (gen_random_uuid(), 'Keen Senses', 1),
    (gen_random_uuid(), 'Trance', 1),
    (gen_random_uuid(), 'Gnomish Cunning', 1),
    (gen_random_uuid(), 'Gnomish Lineage', 1),
    (gen_random_uuid(), 'Giant Ancestry', 1),
    (gen_random_uuid(), 'Large Form', 1),
    (gen_random_uuid(), 'Powerful Build', 1),
    (gen_random_uuid(), 'Brave', 1),
    (gen_random_uuid(), 'Halfling Nimbleness', 1),
    (gen_random_uuid(), 'Luck', 1),
    (gen_random_uuid(), 'Stealthy', 1),
    (gen_random_uuid(), 'Resourceful', 1),
    (gen_random_uuid(), 'Skillful', 1),
    (gen_random_uuid(), 'Versatile', 1),
    (gen_random_uuid(), 'Adrenaline Rush', 1),
    (gen_random_uuid(), 'Relentless', 1),
    (gen_random_uuid(), 'Endurance', 1),
    (gen_random_uuid(), 'Fiendish Legacy', 1),
    (gen_random_uuid(), 'Presence', 1),
    (gen_random_uuid(), 'Vampiric Bite', 1),
    (gen_random_uuid(), 'Fire Resistance', 1),
    (gen_random_uuid(), 'Cold Resistance', 1),
    (gen_random_uuid(), 'Misty Step', 1),
    (gen_random_uuid(), 'Astral Knowledge', 1),
    (gen_random_uuid(), 'Psychic Resistance', 1),
    -- Class Features
    (gen_random_uuid(), 'Magical Tinkering', 1),
    (gen_random_uuid(), 'Infuse Item', 1),
    (gen_random_uuid(), 'Rage', 1),
    (gen_random_uuid(), 'Unarmored Defense', 1),
    (gen_random_uuid(), 'Reckless Attack', 1),
    (gen_random_uuid(), 'Bardic Inspiration', 1),
    (gen_random_uuid(), 'Jack of All Trades', 1),
    (gen_random_uuid(), 'Song of Rest', 1),
    (gen_random_uuid(), 'Spellcasting', 1),
    (gen_random_uuid(), 'Channel Divinity', 1),
    (gen_random_uuid(), 'Divine Intervention', 1),
    (gen_random_uuid(), 'Wild Shape', 1),
    (gen_random_uuid(), 'Fighting Style', 1),
    (gen_random_uuid(), 'Second Wind', 1),
    (gen_random_uuid(), 'Action Surge', 1),
    (gen_random_uuid(), 'Extra Attack', 1),
    (gen_random_uuid(), 'Martial Arts', 1),
    (gen_random_uuid(), 'Ki', 1),
    (gen_random_uuid(), 'Deflect Missiles', 1),
    (gen_random_uuid(), 'Divine Sense', 1),
    (gen_random_uuid(), 'Lay on Hands', 1),
    (gen_random_uuid(), 'Divine Smite', 1),
    (gen_random_uuid(), 'Favored Enemy', 1),
    (gen_random_uuid(), 'Natural Explorer', 1),
    (gen_random_uuid(), 'Primeval Awareness', 1),
    (gen_random_uuid(), 'Sneak Attack', 1),
    (gen_random_uuid(), 'Thieves Cant', 1),
    (gen_random_uuid(), 'Cunning Action', 1),
    (gen_random_uuid(), 'Evasion', 1),
    (gen_random_uuid(), 'Sorcery Points', 1),
    (gen_random_uuid(), 'Metamagic', 1),
    (gen_random_uuid(), 'Eldritch Invocations', 1),
    (gen_random_uuid(), 'Pact Boon', 1),
    (gen_random_uuid(), 'Arcane Recovery', 1),
    (gen_random_uuid(), 'Spell Mastery', 1)
ON CONFLICT (attribute_name) DO NOTHING;

-- ==================== RACES ====================
INSERT INTO races (id, race_name, custom) VALUES
    (gen_random_uuid(), 'Aasimar', false),
    (gen_random_uuid(), 'Dragonborn', false),
    (gen_random_uuid(), 'Dwarf', false),
    (gen_random_uuid(), 'Elf', false),
    (gen_random_uuid(), 'Gnome', false),
    (gen_random_uuid(), 'Goliath', false),
    (gen_random_uuid(), 'Halfling', false),
    (gen_random_uuid(), 'Human', false),
    (gen_random_uuid(), 'Orc', false),
    (gen_random_uuid(), 'Tiefling', false),
    (gen_random_uuid(), 'Dhampir', false),
    (gen_random_uuid(), 'Githyanki', false),
    (gen_random_uuid(), 'Githzerai', false)
ON CONFLICT (race_name) DO NOTHING;

-- ==================== RACE ATTRIBUTES ====================
-- Aasimar: Celestial Resistance, Darkvision, Healing Hands, Light Bearer, Celestial Revelation
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Aasimar' AND a.attribute_name = 'Celestial Resistance'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Aasimar' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Aasimar' AND a.attribute_name = 'Healing Hands'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Aasimar' AND a.attribute_name = 'Light Bearer'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Aasimar' AND a.attribute_name = 'Celestial Revelation'
ON CONFLICT DO NOTHING;

-- Dragonborn: Dragon Ancestry, Breath Weapon, Damage Resistance, Darkvision, Flight
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dragonborn' AND a.attribute_name = 'Dragon Ancestry'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dragonborn' AND a.attribute_name = 'Breath Weapon'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dragonborn' AND a.attribute_name = 'Damage Resistance'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dragonborn' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dragonborn' AND a.attribute_name = 'Flight'
ON CONFLICT DO NOTHING;

-- Dwarf: Darkvision, Dwarven Resilience, Dwarven Toughness, Stonecunning
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dwarf' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dwarf' AND a.attribute_name = 'Dwarven Resilience'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dwarf' AND a.attribute_name = 'Dwarven Toughness'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dwarf' AND a.attribute_name = 'Stonecunning'
ON CONFLICT DO NOTHING;

-- Elf: Darkvision, Elven Lineage, Fey Ancestry, Keen Senses, Trance
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Elf' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Elf' AND a.attribute_name = 'Elven Lineage'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Elf' AND a.attribute_name = 'Fey Ancestry'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Elf' AND a.attribute_name = 'Keen Senses'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Elf' AND a.attribute_name = 'Trance'
ON CONFLICT DO NOTHING;

-- Gnome: Darkvision, Gnomish Cunning, Gnomish Lineage
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Gnome' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Gnome' AND a.attribute_name = 'Gnomish Cunning'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Gnome' AND a.attribute_name = 'Gnomish Lineage'
ON CONFLICT DO NOTHING;

-- Goliath: Giant Ancestry, Large Form, Powerful Build
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Goliath' AND a.attribute_name = 'Giant Ancestry'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Goliath' AND a.attribute_name = 'Large Form'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Goliath' AND a.attribute_name = 'Powerful Build'
ON CONFLICT DO NOTHING;

-- Halfling: Brave, Halfling Nimbleness, Luck, Stealthy
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Halfling' AND a.attribute_name = 'Brave'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Halfling' AND a.attribute_name = 'Halfling Nimbleness'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Halfling' AND a.attribute_name = 'Luck'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Halfling' AND a.attribute_name = 'Stealthy'
ON CONFLICT DO NOTHING;

-- Human: Resourceful, Skillful, Versatile
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Human' AND a.attribute_name = 'Resourceful'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Human' AND a.attribute_name = 'Skillful'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Human' AND a.attribute_name = 'Versatile'
ON CONFLICT DO NOTHING;

-- Orc: Adrenaline Rush, Darkvision, Relentless, Endurance
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Orc' AND a.attribute_name = 'Adrenaline Rush'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Orc' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Orc' AND a.attribute_name = 'Relentless'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Orc' AND a.attribute_name = 'Endurance'
ON CONFLICT DO NOTHING;

-- Tiefling: Darkvision, Fiendish Legacy, Presence
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Tiefling' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Tiefling' AND a.attribute_name = 'Fiendish Legacy'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Tiefling' AND a.attribute_name = 'Presence'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Tiefling' AND a.attribute_name = 'Fire Resistance'
ON CONFLICT DO NOTHING;

-- Dhampir (Astarion's Book of Hungers): Darkvision, Vampiric Bite, Damage Resistance
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dhampir' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dhampir' AND a.attribute_name = 'Vampiric Bite'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Dhampir' AND a.attribute_name = 'Damage Resistance'
ON CONFLICT DO NOTHING;

-- Githyanki: Astral Knowledge, Psychic Resistance, Misty Step
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Githyanki' AND a.attribute_name = 'Astral Knowledge'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Githyanki' AND a.attribute_name = 'Psychic Resistance'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Githyanki' AND a.attribute_name = 'Misty Step'
ON CONFLICT DO NOTHING;

-- Githzerai: Psychic Resistance, Darkvision
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Githzerai' AND a.attribute_name = 'Psychic Resistance'
ON CONFLICT DO NOTHING;
INSERT INTO race_attributes (race_id, attribute_id)
SELECT r.id, a.id FROM races r, attributes a WHERE r.race_name = 'Githzerai' AND a.attribute_name = 'Darkvision'
ON CONFLICT DO NOTHING;

-- ==================== RACE ABILITY ASSIGNMENTS (PHB 2014) ====================
-- Ability score bonuses granted by each race

-- Aasimar (Volo's Guide): +2 CHA
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'CHARISMA', 2, r.id FROM races r WHERE r.race_name = 'Aasimar'
ON CONFLICT DO NOTHING;

-- Dragonborn (PHB): +2 STR, +1 CHA
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'STRENGTH', 2, r.id FROM races r WHERE r.race_name = 'Dragonborn'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'CHARISMA', 1, r.id FROM races r WHERE r.race_name = 'Dragonborn'
ON CONFLICT DO NOTHING;

-- Dwarf (PHB): +2 CON
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'CONSTITUTION', 2, r.id FROM races r WHERE r.race_name = 'Dwarf'
ON CONFLICT DO NOTHING;

-- Elf (PHB): +2 DEX
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'DEXTERITY', 2, r.id FROM races r WHERE r.race_name = 'Elf'
ON CONFLICT DO NOTHING;

-- Gnome (PHB): +2 INT
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'INTELLIGENCE', 2, r.id FROM races r WHERE r.race_name = 'Gnome'
ON CONFLICT DO NOTHING;

-- Goliath (EE Player's Companion): +2 STR, +1 CON
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'STRENGTH', 2, r.id FROM races r WHERE r.race_name = 'Goliath'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'CONSTITUTION', 1, r.id FROM races r WHERE r.race_name = 'Goliath'
ON CONFLICT DO NOTHING;

-- Halfling (PHB): +2 DEX
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'DEXTERITY', 2, r.id FROM races r WHERE r.race_name = 'Halfling'
ON CONFLICT DO NOTHING;

-- Human (PHB): +1 to all abilities
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'STRENGTH', 1, r.id FROM races r WHERE r.race_name = 'Human'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'DEXTERITY', 1, r.id FROM races r WHERE r.race_name = 'Human'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'CONSTITUTION', 1, r.id FROM races r WHERE r.race_name = 'Human'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'INTELLIGENCE', 1, r.id FROM races r WHERE r.race_name = 'Human'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'WISDOM', 1, r.id FROM races r WHERE r.race_name = 'Human'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'CHARISMA', 1, r.id FROM races r WHERE r.race_name = 'Human'
ON CONFLICT DO NOTHING;

-- Orc (Volo's/similar to Half-Orc PHB): +2 STR, +1 CON
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'STRENGTH', 2, r.id FROM races r WHERE r.race_name = 'Orc'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'CONSTITUTION', 1, r.id FROM races r WHERE r.race_name = 'Orc'
ON CONFLICT DO NOTHING;

-- Tiefling (PHB): +2 CHA, +1 INT
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'CHARISMA', 2, r.id FROM races r WHERE r.race_name = 'Tiefling'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'INTELLIGENCE', 1, r.id FROM races r WHERE r.race_name = 'Tiefling'
ON CONFLICT DO NOTHING;

-- Dhampir (Van Richten's Guide): No fixed ability bonuses (flexible ASI in newer books)
-- Skipped - uses Tasha's flexible ability score rules

-- Githyanki (Mordenkainen's Tome): +2 STR, +1 INT
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'STRENGTH', 2, r.id FROM races r WHERE r.race_name = 'Githyanki'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'INTELLIGENCE', 1, r.id FROM races r WHERE r.race_name = 'Githyanki'
ON CONFLICT DO NOTHING;

-- Githzerai (Mordenkainen's Tome): +2 WIS, +1 INT
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'WISDOM', 2, r.id FROM races r WHERE r.race_name = 'Githzerai'
ON CONFLICT DO NOTHING;
INSERT INTO race_ability_assignments (id, ability_type, bonus_points, race_id)
SELECT gen_random_uuid(), 'INTELLIGENCE', 1, r.id FROM races r WHERE r.race_name = 'Githzerai'
ON CONFLICT DO NOTHING;

-- ==================== CLASSES ====================
INSERT INTO classes (id, class_name, background, hit_dice) VALUES
    (gen_random_uuid(), 'Artificer', 'Artificers are powerful magic wielders who are experts at creating and forging magic items and potions to assist their allies or bring doom to their foes.', 'D8'),
    (gen_random_uuid(), 'Barbarian', 'Barbarians are powerful warriors whose strength comes from their rage. Able to use their anger as a weapon. The subclass represents different paths they walk, which teaches them special ways to use their anger.', 'D12'),
    (gen_random_uuid(), 'Bard', 'A poet, a singer, a storyteller. There are those that seek to bring wonder to the world, and their magic comes from their emotions from the stories they tell and the songs they sing. Bards have different colleges that they follow to hone their skills in magic.', 'D8'),
    (gen_random_uuid(), 'Cleric', 'Ideas are not just a simple blueprint for a machine or an urge to buy new farming equipment. Ideas are immortal things that can topple empires and bring justice to those that threaten others. Ideas are some of the most powerful forces in the universe. All it needs is a champion, and clerics are those champions. Usually following a pantheon or a god/goddess, they devote their lives to serving that idea.', 'D8'),
    (gen_random_uuid(), 'Druid', 'Druids are protectors of nature. They are the embodiment of it''s wrath and it''s beauty. They have the ability to shapeshift into creatures and special skills, based on which circle they follow which is a further representation of different parts of nature.', 'D8'),
    (gen_random_uuid(), 'Fighter', 'Swordsman ship, spears, shields, bows and crossbows. All these bring about images of fighters. Warriors who hone their combative ability to a deadly skill that rivals none. Some use magic to enhance their ability, while others crush magic in favor of pure muscle or acrobatic skills.', 'D10'),
    (gen_random_uuid(), 'Monk', 'Kung Fu, Karate, Drunken Fighting, Dr. Strange, ect. All of these are what the D&D Monks train in. Whether it''s using your fist, spirit, ki or weapons that are nothing but an extension of your will. Monks can deliver a storm of powerful melee attacks.', 'D8'),
    (gen_random_uuid(), 'Paladin', 'Paladins, much like clerics, hold up ideas. However, they serve tenants with a multitude of ideas. Some of joy, others of light and conquest. Paladin holds an Oath which is the representation of said ideas.', 'D10'),
    (gen_random_uuid(), 'Ranger', 'Rangers are those that wander and live within the wild. Their skill to survive in harsh nature places is bested by none. Many rangers take on a role, usually in various ways to hunt special types of monsters.', 'D10'),
    (gen_random_uuid(), 'Rogue', 'Rogues are talented individuals who hone skills of the unethical or criminal. A rogue''s skill in thieving, killing, etc. is rivaled by none as they become experts in their field.', 'D8'),
    (gen_random_uuid(), 'Sorcerer', 'Usually born with magical energy running through their veins. Sorcerers are what people usually think of when the image of a "spellslinger" comes to mind. Their magical force is linked to their emotions and mind.', 'D6'),
    (gen_random_uuid(), 'Warlock', 'With the dark stereotype of being evil, warlocks are feared. Usually, these are mortals who have signed a magical contract with immortal entities where the entity will gift them magical power for the price of servitude.', 'D8'),
    (gen_random_uuid(), 'Wizard', 'Wizards are considered the Apex of the Arcane and spend a lot of their life in education and schooling. With their massive knowledge of magic, they know exactly how to shape magical forces to do what they desire. Most of the time, wizards tend to walk down a school of magic to master in.', 'D6')
ON CONFLICT (class_name) DO NOTHING;

-- ==================== CLASS ATTRIBUTES ====================
-- Artificer: Magical Tinkering, Infuse Item, Spellcasting
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Artificer' AND a.attribute_name = 'Magical Tinkering'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Artificer' AND a.attribute_name = 'Infuse Item'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Artificer' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;

-- Barbarian: Rage, Unarmored Defense, Reckless Attack, Extra Attack
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Barbarian' AND a.attribute_name = 'Rage'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Barbarian' AND a.attribute_name = 'Unarmored Defense'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Barbarian' AND a.attribute_name = 'Reckless Attack'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Barbarian' AND a.attribute_name = 'Extra Attack'
ON CONFLICT DO NOTHING;

-- Bard: Bardic Inspiration, Jack of All Trades, Song of Rest, Spellcasting
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Bard' AND a.attribute_name = 'Bardic Inspiration'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Bard' AND a.attribute_name = 'Jack of All Trades'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Bard' AND a.attribute_name = 'Song of Rest'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Bard' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;

-- Cleric: Spellcasting, Channel Divinity, Divine Intervention
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Cleric' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Cleric' AND a.attribute_name = 'Channel Divinity'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Cleric' AND a.attribute_name = 'Divine Intervention'
ON CONFLICT DO NOTHING;

-- Druid: Spellcasting, Wild Shape
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Druid' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Druid' AND a.attribute_name = 'Wild Shape'
ON CONFLICT DO NOTHING;

-- Fighter: Fighting Style, Second Wind, Action Surge, Extra Attack
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Fighter' AND a.attribute_name = 'Fighting Style'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Fighter' AND a.attribute_name = 'Second Wind'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Fighter' AND a.attribute_name = 'Action Surge'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Fighter' AND a.attribute_name = 'Extra Attack'
ON CONFLICT DO NOTHING;

-- Monk: Martial Arts, Ki, Unarmored Defense, Deflect Missiles, Extra Attack
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Monk' AND a.attribute_name = 'Martial Arts'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Monk' AND a.attribute_name = 'Ki'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Monk' AND a.attribute_name = 'Unarmored Defense'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Monk' AND a.attribute_name = 'Deflect Missiles'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Monk' AND a.attribute_name = 'Extra Attack'
ON CONFLICT DO NOTHING;

-- Paladin: Divine Sense, Lay on Hands, Fighting Style, Spellcasting, Divine Smite, Extra Attack
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Paladin' AND a.attribute_name = 'Divine Sense'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Paladin' AND a.attribute_name = 'Lay on Hands'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Paladin' AND a.attribute_name = 'Fighting Style'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Paladin' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Paladin' AND a.attribute_name = 'Divine Smite'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Paladin' AND a.attribute_name = 'Extra Attack'
ON CONFLICT DO NOTHING;

-- Ranger: Favored Enemy, Natural Explorer, Fighting Style, Spellcasting, Primeval Awareness, Extra Attack
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Ranger' AND a.attribute_name = 'Favored Enemy'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Ranger' AND a.attribute_name = 'Natural Explorer'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Ranger' AND a.attribute_name = 'Fighting Style'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Ranger' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Ranger' AND a.attribute_name = 'Primeval Awareness'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Ranger' AND a.attribute_name = 'Extra Attack'
ON CONFLICT DO NOTHING;

-- Rogue: Sneak Attack, Thieves Cant, Cunning Action, Evasion
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Rogue' AND a.attribute_name = 'Sneak Attack'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Rogue' AND a.attribute_name = 'Thieves Cant'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Rogue' AND a.attribute_name = 'Cunning Action'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Rogue' AND a.attribute_name = 'Evasion'
ON CONFLICT DO NOTHING;

-- Sorcerer: Spellcasting, Sorcery Points, Metamagic
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Sorcerer' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Sorcerer' AND a.attribute_name = 'Sorcery Points'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Sorcerer' AND a.attribute_name = 'Metamagic'
ON CONFLICT DO NOTHING;

-- Warlock: Spellcasting, Eldritch Invocations, Pact Boon
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Warlock' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Warlock' AND a.attribute_name = 'Eldritch Invocations'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Warlock' AND a.attribute_name = 'Pact Boon'
ON CONFLICT DO NOTHING;

-- Wizard: Spellcasting, Arcane Recovery, Spell Mastery
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Wizard' AND a.attribute_name = 'Spellcasting'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Wizard' AND a.attribute_name = 'Arcane Recovery'
ON CONFLICT DO NOTHING;
INSERT INTO class_attributes (character_class_id, attribute_id)
SELECT c.id, a.id FROM classes c, attributes a WHERE c.class_name = 'Wizard' AND a.attribute_name = 'Spell Mastery'
ON CONFLICT DO NOTHING;

-- ==================== SUBCLASSES ====================

-- Artificer Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Armorer', 'Fuse powerful magic with your armor to create exoskeleton suits', (SELECT id FROM classes WHERE class_name = 'Artificer'), false),
    (gen_random_uuid(), 'Alchemist', 'A master of potion-making to heal, assist and destroy', (SELECT id FROM classes WHERE class_name = 'Artificer'), false),
    (gen_random_uuid(), 'Artillerist', 'Control the battlefield by summoning powerful magic cannons.', (SELECT id FROM classes WHERE class_name = 'Artificer'), false),
    (gen_random_uuid(), 'Battle Smith', 'Creating magical machines that fight and protect others.', (SELECT id FROM classes WHERE class_name = 'Artificer'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Barbarian Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Berserker', 'Fall into your rage entirely to deliver a tide of powerful blows.', (SELECT id FROM classes WHERE class_name = 'Barbarian'), false),
    (gen_random_uuid(), 'Totem Warrior', 'Your rage comes from the animal spirits of the world who aid.', (SELECT id FROM classes WHERE class_name = 'Barbarian'), false),
    (gen_random_uuid(), 'Ancestral Guardian', 'Your rage is the combination of all your ancestors.', (SELECT id FROM classes WHERE class_name = 'Barbarian'), false),
    (gen_random_uuid(), 'Storm Herald', 'Your rage is second only to that of mother nature, who joins you.', (SELECT id FROM classes WHERE class_name = 'Barbarian'), false),
    (gen_random_uuid(), 'Zealot', 'The rage acts as a gift from the gods. You are their champion.', (SELECT id FROM classes WHERE class_name = 'Barbarian'), false),
    (gen_random_uuid(), 'Beast', 'Gifts from the beasts of this world as you manifest their power.', (SELECT id FROM classes WHERE class_name = 'Barbarian'), false),
    (gen_random_uuid(), 'Wild Soul', 'Your rage is strong enough to shatter the walls of magic.', (SELECT id FROM classes WHERE class_name = 'Barbarian'), false),
    (gen_random_uuid(), 'Battlerager', 'Giving yourself over to your rage, make your body a weapon.', (SELECT id FROM classes WHERE class_name = 'Barbarian'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Bard Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'College of Lore', 'A way to keep the stories of history and civilizations alive.', (SELECT id FROM classes WHERE class_name = 'Bard'), false),
    (gen_random_uuid(), 'College of Valor', 'Those that tell vibrant and powerful war stories.', (SELECT id FROM classes WHERE class_name = 'Bard'), false),
    (gen_random_uuid(), 'College of Creation', 'Your music and stories shape the very fabric of reality.', (SELECT id FROM classes WHERE class_name = 'Bard'), false),
    (gen_random_uuid(), 'College of Glamor', 'Blessed by the Feywild, your looks are rivaled by none.', (SELECT id FROM classes WHERE class_name = 'Bard'), false),
    (gen_random_uuid(), 'College of Swords', 'Become the best and most elegant sword fighter in the world.', (SELECT id FROM classes WHERE class_name = 'Bard'), false),
    (gen_random_uuid(), 'College of Whispers', 'The hypnotic power of bards can be used for stealth.', (SELECT id FROM classes WHERE class_name = 'Bard'), false),
    (gen_random_uuid(), 'College of Eloquence', 'Words have power; use them to shape any situation.', (SELECT id FROM classes WHERE class_name = 'Bard'), false),
    (gen_random_uuid(), 'College of Spirits', 'The dead tell stories and have experiences that you can draw on.', (SELECT id FROM classes WHERE class_name = 'Bard'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Cleric Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Knowledge Domain', 'Serve the idea that knowledge is power, and it must endure.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Life Domain', 'Serve the idea of life; every life and living thing is a wonder.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Light Domain', 'Serve the idea of light; it will burn back the forces of shadow.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Nature Domain', 'Serve the idea of nature; the natural world can''t ever fall.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Tempest Domain', 'Serve the idea of change, storms are powerful and resistant', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Trickery Domain', 'Serve the idea of deception, pranks, or more keeps the world moving', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'War Domain', 'Serve the idea of war, whether it''s war for honor or power.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Death Domain', 'Serve the idea of death; everything must eventually end.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Twilight Domain', 'Serve the idea of balance; those that attempt to disrupt it must be stopped.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Order Domain', 'Serve the idea of order and law; you are the voice of justice.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Forge Domain', 'Serve the idea of creation; the forges you touch will never fail', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Grave Domain', 'Serve the idea of life and death; the balance must be maintained', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Peace Domain', 'Serve the idea of peace; violence is almost never the answer.', (SELECT id FROM classes WHERE class_name = 'Cleric'), false),
    (gen_random_uuid(), 'Arcane Domain', 'Serve the idea of magic; magic is a power and a wonder', (SELECT id FROM classes WHERE class_name = 'Cleric'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Druid Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Circle of the Land', 'Grown within a certain biome, your power comes from there.', (SELECT id FROM classes WHERE class_name = 'Druid'), false),
    (gen_random_uuid(), 'Circle of the Moon', 'Like a werewolf, your power is based on changing forms.', (SELECT id FROM classes WHERE class_name = 'Druid'), false),
    (gen_random_uuid(), 'Circle of Dreams', 'The Feywild''s nature has blessed you with the power to heal.', (SELECT id FROM classes WHERE class_name = 'Druid'), false),
    (gen_random_uuid(), 'Circle of Shepherd', 'Like a shepherd, you protect the animals of the world.', (SELECT id FROM classes WHERE class_name = 'Druid'), false),
    (gen_random_uuid(), 'Circle of Spores', 'Mycelium has many uses and abilities, including raising the dead.', (SELECT id FROM classes WHERE class_name = 'Druid'), false),
    (gen_random_uuid(), 'Circle of Stars', 'The answer and guidance can always be found in the stars.', (SELECT id FROM classes WHERE class_name = 'Druid'), false),
    (gen_random_uuid(), 'Circle of Wildfire', 'Wildfires bring about change, ecosystems always revive.', (SELECT id FROM classes WHERE class_name = 'Druid'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Fighter Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Champion', 'Hone your martial ability into an incredibly deadly skill with constant crits.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Battle Master', 'Use the art of war and tactics to gain advantages and command to victory.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Eldritch Knight', 'Learning wizard-like spells to gain the upperhand in any fight.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Arcane Archer', 'Mix magic with your arrows to rain literal fire down upon your foes.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Cavalier', 'You will never break; your skill, while mounted or not, can not be beaten.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Samurai', 'Your fighting spirit will allow you to rain a hurricane of deadly blows.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Psi Warrior', 'Blessed with psychic energy, your mind is sharpened just like your weapon.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Rune Knight', 'Learn the ancient power of Giants and their powerful magic runes.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Echo Fighter', 'Using magical energy, create an "echo" to fight with you.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false),
    (gen_random_uuid(), 'Purple Dragon Knight', 'A warrior that braves any battle through inspiration.', (SELECT id FROM classes WHERE class_name = 'Fighter'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Monk Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Way of the Open Hand', 'Use your fists and palms to annihilate your foe.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of the Shadow', 'Usually called, ninjas and so forth. Their fists strike from the shadow.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of the Four Elements', 'Control all 4 elements, earth, water, fire and wind in your ways.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of Mercy', 'Your ki and spirit is meant to heal wounds, not create them.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of the Astral Self', 'Your spirit becomes an entity around you to help you.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of the Drunken Master', 'Confuse your foes with unpredictable attacks.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of the Kensei', 'Your weapons become an extension of yourself. A form of art.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of the Sun Soul', 'Your soul and will is so powerful that it can ignite in fire.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of the Long Death', 'Your soul and fists become the tools of death.', (SELECT id FROM classes WHERE class_name = 'Monk'), false),
    (gen_random_uuid(), 'Way of the Ascendant Dragon', 'Following the way of dragons, your spirit manifests their power.', (SELECT id FROM classes WHERE class_name = 'Monk'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Paladin Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Oath of Devotion', 'Light, Lawful, Honesty, the pure holy warrior.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false),
    (gen_random_uuid(), 'Oath of the Ancients', 'Joy and love, the ancients blessed this warrior with nature.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false),
    (gen_random_uuid(), 'Oath of Vengeance', 'Anger and vengeance, something bad pushed this warrior to seek vengeance.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false),
    (gen_random_uuid(), 'Oathbreaker', 'They broke an oath long ago and are cursed for it.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false),
    (gen_random_uuid(), 'Oath of Conquest', 'Destruction and Victory, nothing will stop this warrior.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false),
    (gen_random_uuid(), 'Oath of Redemption', 'A warrior that uses words instead of the sword.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false),
    (gen_random_uuid(), 'Oath of Glory', 'A warrior that is destined for glory, fight for your destiny.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false),
    (gen_random_uuid(), 'Oath of the Watchers', 'A warrior sworn to fight anything supernatural.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false),
    (gen_random_uuid(), 'Oath of the Crown', 'A warrior that serves a crown or kingdom.', (SELECT id FROM classes WHERE class_name = 'Paladin'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Ranger Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Fey Wanderer', 'With the power of fey on their side, these rangers charm their foes.', (SELECT id FROM classes WHERE class_name = 'Ranger'), false),
    (gen_random_uuid(), 'Swarmkeeper', 'Insects, pixies or a similar swarm creature. These rangers take care of them.', (SELECT id FROM classes WHERE class_name = 'Ranger'), false),
    (gen_random_uuid(), 'Gloom Stalker', 'These hunters wander in the shadows to defeat creatures of the night.', (SELECT id FROM classes WHERE class_name = 'Ranger'), false),
    (gen_random_uuid(), 'Horizon Walker', 'These hunters seek out creatures from other worlds to end them.', (SELECT id FROM classes WHERE class_name = 'Ranger'), false),
    (gen_random_uuid(), 'Monster Slayer', 'These warriors hunt down to slay powerful monsters.', (SELECT id FROM classes WHERE class_name = 'Ranger'), false),
    (gen_random_uuid(), 'Hunter', 'A warrior who hones different parts of their fighting style to hunt.', (SELECT id FROM classes WHERE class_name = 'Ranger'), false),
    (gen_random_uuid(), 'Beast Master', 'A warrior who has gained the assistance of a spiritual beast.', (SELECT id FROM classes WHERE class_name = 'Ranger'), false),
    (gen_random_uuid(), 'Drakewarden', 'A warrior who has gained the assistance of a powerful drake that follows them.', (SELECT id FROM classes WHERE class_name = 'Ranger'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Rogue Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Thief', 'Thieves are rogues who are experts at breaking into things and stealing.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false),
    (gen_random_uuid(), 'Assassin', 'Assassins are masters at killing while unseen.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false),
    (gen_random_uuid(), 'Arcane Trickster', 'Tricksters mix magic into their skills, enhancing them.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false),
    (gen_random_uuid(), 'Inquisitive', 'Like a detective, inquisitive rogues watch their targets and use their patterns.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false),
    (gen_random_uuid(), 'Mastermind', 'These rogues are deadly smart, using their intelligence to fight.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false),
    (gen_random_uuid(), 'Scout', 'Ambushing and Stealthing with speed, these rogues are always ahead.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false),
    (gen_random_uuid(), 'Swashbuckler', 'Rogues that are fast and light on their feet, impossible to pin.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false),
    (gen_random_uuid(), 'Phantom', 'Shadow magic is within the hearts of these rogues, stealing souls.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false),
    (gen_random_uuid(), 'Soulknife', 'Blessed with a psychic mind, their roguish skills are enhanced.', (SELECT id FROM classes WHERE class_name = 'Rogue'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Sorcerer Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'Aberrant Mind', 'Cursed or blessed with a powerful psychic mind, their magic comes from their head.', (SELECT id FROM classes WHERE class_name = 'Sorcerer'), false),
    (gen_random_uuid(), 'Clockwork Soul', 'The balance of the universe flows through their veins.', (SELECT id FROM classes WHERE class_name = 'Sorcerer'), false),
    (gen_random_uuid(), 'Divine Soul', 'With blood from something Divine, gods watch them with interest.', (SELECT id FROM classes WHERE class_name = 'Sorcerer'), false),
    (gen_random_uuid(), 'Shadow Magic', 'Cursed with shadow magic, their power manipulates the shadows.', (SELECT id FROM classes WHERE class_name = 'Sorcerer'), false),
    (gen_random_uuid(), 'Storm Sorcery', 'With the blood of a powerful hurricane, storms are a comfort.', (SELECT id FROM classes WHERE class_name = 'Sorcerer'), false),
    (gen_random_uuid(), 'Draconic Bloodline', 'With the ancestors of dragons, they show draconic natures.', (SELECT id FROM classes WHERE class_name = 'Sorcerer'), false),
    (gen_random_uuid(), 'Wild Magic', 'The chaos of the universe flows through their veins.', (SELECT id FROM classes WHERE class_name = 'Sorcerer'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Warlock Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'The Archfey', 'A magical pact with an Archfey of the feywild.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false),
    (gen_random_uuid(), 'The Fiend', 'A magical pact with a demonic or devilish entity.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false),
    (gen_random_uuid(), 'The Great Old One', 'An ancient and powerful unknown entity from worlds beyond.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false),
    (gen_random_uuid(), 'The Celestial', 'A magical pact with an entity of good, law, and order.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false),
    (gen_random_uuid(), 'Undying', 'A magical pact with an entity that represents the dead.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false),
    (gen_random_uuid(), 'The Hexblade', 'A magical pact with an entity that is or gifted a powerful weapon.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false),
    (gen_random_uuid(), 'The Fathomless', 'A magical pact with a creature of the world''s deep oceans.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false),
    (gen_random_uuid(), 'The Genie', 'A magical pact with a powerful elemental.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false),
    (gen_random_uuid(), 'The Undead', 'A magical pact with a powerful deathless being that defies the cycle.', (SELECT id FROM classes WHERE class_name = 'Warlock'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- Wizard Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id, custom) VALUES
    (gen_random_uuid(), 'School of Abjuration', 'Study the defensive powers of magic.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Conjuration', 'Study the ways to control the creatures you summon.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Divination', 'Study the ways magic can show you the future and past.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Enchantment', 'Study the ways that magic can bend the minds of others.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Evocation', 'Study the ways that magic can destroy and offense.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Illusion', 'Study the ways that magic can make the eyes of others lie.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Necromancy', 'Study the forces of life and death.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Transmutation', 'Study the ways magic can shift reality.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Graviturgy', 'Study the ways magic can shift and manipulate gravity.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'School of Chronurgy', 'Study the ways magic can shift and bend time itself.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'War Magic', 'Study the ways magic can be used in combat and how it can be stored.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'Bladesinging', 'Study a tradition of wizardry that incorporates swordplay and dance.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false),
    (gen_random_uuid(), 'Order of Scribes', 'Study the ways magic can be enhanced through books of power.', (SELECT id FROM classes WHERE class_name = 'Wizard'), false)
ON CONFLICT (subclass_name) DO NOTHING;

-- ==================== ALIGNMENTS ====================

INSERT INTO alignments (id, alignment_name, alignment_description) VALUES
    (gen_random_uuid(), 'Lawful Good', 'Believes in honor, justice and doing the right thing as expected by society and the law.'),
    (gen_random_uuid(), 'Neutral Good', 'Believes in trying to do what''s right but is not bound by laws, social norms or tradition.'),
    (gen_random_uuid(), 'Chaotic Good', 'Believes in following their conscience with little regard for the law or what others expect.'),
    (gen_random_uuid(), 'Lawful Neutral', 'Believes in the rule of law but isn''t swayed by those in need or the temptations of evil.'),
    (gen_random_uuid(), 'True Neutral', 'Believes in doing what seems best at the time and avoids taking sides or moral arguments.'),
    (gen_random_uuid(), 'Chaotic Neutral', 'Believes in their personal freedom and following their own desires and whims.'),
    (gen_random_uuid(), 'Lawful Evil', 'Believes in taking what they want within the limits of the law or a personal code.'),
    (gen_random_uuid(), 'Neutral Evil', 'Believes in taking what they want and are untroubled by who they hurt or which laws they break.'),
    (gen_random_uuid(), 'Chaotic Evil', 'Believes in arbitrary violence, spurred by hatred, bloodlust or a desire for vengeance.')
ON CONFLICT (alignment_name) DO NOTHING;