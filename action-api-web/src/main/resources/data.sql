-- Initial seed data for classes and subclasses
-- Uses ON CONFLICT DO NOTHING to skip if already exists (by name)

-- ==================== CLASSES ====================
INSERT INTO classes (id, class_name, background) VALUES
    (gen_random_uuid(), 'Artificer', 'Artificers are powerful magic wielders who are experts at creating and forging magic items and potions to assist their allies or bring doom to their foes.'),
    (gen_random_uuid(), 'Barbarian', 'Barbarians are powerful warriors whose strength comes from their rage. Able to use their anger as a weapon. The subclass represents different paths they walk, which teaches them special ways to use their anger.'),
    (gen_random_uuid(), 'Bard', 'A poet, a singer, a storyteller. There are those that seek to bring wonder to the world, and their magic comes from their emotions from the stories they tell and the songs they sing. Bards have different colleges that they follow to hone their skills in magic.'),
    (gen_random_uuid(), 'Cleric', 'Ideas are not just a simple blueprint for a machine or an urge to buy new farming equipment. Ideas are immortal things that can topple empires and bring justice to those that threaten others. Ideas are some of the most powerful forces in the universe. All it needs is a champion, and clerics are those champions. Usually following a pantheon or a god/goddess, they devote their lives to serving that idea.'),
    (gen_random_uuid(), 'Druid', 'Druids are protectors of nature. They are the embodiment of it''s wrath and it''s beauty. They have the ability to shapeshift into creatures and special skills, based on which circle they follow which is a further representation of different parts of nature.'),
    (gen_random_uuid(), 'Fighter', 'Swordsman ship, spears, shields, bows and crossbows. All these bring about images of fighters. Warriors who hone their combative ability to a deadly skill that rivals none. Some use magic to enhance their ability, while others crush magic in favor of pure muscle or acrobatic skills.'),
    (gen_random_uuid(), 'Monk', 'Kung Fu, Karate, Drunken Fighting, Dr. Strange, ect. All of these are what the D&D Monks train in. Whether it''s using your fist, spirit, ki or weapons that are nothing but an extension of your will. Monks can deliver a storm of powerful melee attacks.'),
    (gen_random_uuid(), 'Paladin', 'Paladins, much like clerics, hold up ideas. However, they serve tenants with a multitude of ideas. Some of joy, others of light and conquest. Paladin holds an Oath which is the representation of said ideas.'),
    (gen_random_uuid(), 'Ranger', 'Rangers are those that wander and live within the wild. Their skill to survive in harsh nature places is bested by none. Many rangers take on a role, usually in various ways to hunt special types of monsters.'),
    (gen_random_uuid(), 'Rogue', 'Rogues are talented individuals who hone skills of the unethical or criminal. A rogue''s skill in thieving, killing, etc. is rivaled by none as they become experts in their field.'),
    (gen_random_uuid(), 'Sorcerer', 'Usually born with magical energy running through their veins. Sorcerers are what people usually think of when the image of a "spellslinger" comes to mind. Their magical force is linked to their emotions and mind.'),
    (gen_random_uuid(), 'Warlock', 'With the dark stereotype of being evil, warlocks are feared. Usually, these are mortals who have signed a magical contract with immortal entities where the entity will gift them magical power for the price of servitude.'),
    (gen_random_uuid(), 'Wizard', 'Wizards are considered the Apex of the Arcane and spend a lot of their life in education and schooling. With their massive knowledge of magic, they know exactly how to shape magical forces to do what they desire. Most of the time, wizards tend to walk down a school of magic to master in.')
ON CONFLICT (class_name) DO NOTHING;

-- ==================== SUBCLASSES ====================

-- Artificer Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Armorer', 'Fuse powerful magic with your armor to create exoskeleton suits', (SELECT id FROM classes WHERE class_name = 'Artificer')),
    (gen_random_uuid(), 'Alchemist', 'A master of potion-making to heal, assist and destroy', (SELECT id FROM classes WHERE class_name = 'Artificer')),
    (gen_random_uuid(), 'Artillerist', 'Control the battlefield by summoning powerful magic cannons.', (SELECT id FROM classes WHERE class_name = 'Artificer')),
    (gen_random_uuid(), 'Battle Smith', 'Creating magical machines that fight and protect others.', (SELECT id FROM classes WHERE class_name = 'Artificer'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Barbarian Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Berserker', 'Fall into your rage entirely to deliver a tide of powerful blows.', (SELECT id FROM classes WHERE class_name = 'Barbarian')),
    (gen_random_uuid(), 'Totem Warrior', 'Your rage comes from the animal spirits of the world who aid.', (SELECT id FROM classes WHERE class_name = 'Barbarian')),
    (gen_random_uuid(), 'Ancestral Guardian', 'Your rage is the combination of all your ancestors.', (SELECT id FROM classes WHERE class_name = 'Barbarian')),
    (gen_random_uuid(), 'Storm Herald', 'Your rage is second only to that of mother nature, who joins you.', (SELECT id FROM classes WHERE class_name = 'Barbarian')),
    (gen_random_uuid(), 'Zealot', 'The rage acts as a gift from the gods. You are their champion.', (SELECT id FROM classes WHERE class_name = 'Barbarian')),
    (gen_random_uuid(), 'Beast', 'Gifts from the beasts of this world as you manifest their power.', (SELECT id FROM classes WHERE class_name = 'Barbarian')),
    (gen_random_uuid(), 'Wild Soul', 'Your rage is strong enough to shatter the walls of magic.', (SELECT id FROM classes WHERE class_name = 'Barbarian')),
    (gen_random_uuid(), 'Battlerager', 'Giving yourself over to your rage, make your body a weapon.', (SELECT id FROM classes WHERE class_name = 'Barbarian'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Bard Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'College of Lore', 'A way to keep the stories of history and civilizations alive.', (SELECT id FROM classes WHERE class_name = 'Bard')),
    (gen_random_uuid(), 'College of Valor', 'Those that tell vibrant and powerful war stories.', (SELECT id FROM classes WHERE class_name = 'Bard')),
    (gen_random_uuid(), 'College of Creation', 'Your music and stories shape the very fabric of reality.', (SELECT id FROM classes WHERE class_name = 'Bard')),
    (gen_random_uuid(), 'College of Glamor', 'Blessed by the Feywild, your looks are rivaled by none.', (SELECT id FROM classes WHERE class_name = 'Bard')),
    (gen_random_uuid(), 'College of Swords', 'Become the best and most elegant sword fighter in the world.', (SELECT id FROM classes WHERE class_name = 'Bard')),
    (gen_random_uuid(), 'College of Whispers', 'The hypnotic power of bards can be used for stealth.', (SELECT id FROM classes WHERE class_name = 'Bard')),
    (gen_random_uuid(), 'College of Eloquence', 'Words have power; use them to shape any situation.', (SELECT id FROM classes WHERE class_name = 'Bard')),
    (gen_random_uuid(), 'College of Spirits', 'The dead tell stories and have experiences that you can draw on.', (SELECT id FROM classes WHERE class_name = 'Bard'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Cleric Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Knowledge Domain', 'Serve the idea that knowledge is power, and it must endure.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Life Domain', 'Serve the idea of life; every life and living thing is a wonder.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Light Domain', 'Serve the idea of light; it will burn back the forces of shadow.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Nature Domain', 'Serve the idea of nature; the natural world can''t ever fall.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Tempest Domain', 'Serve the idea of change, storms are powerful and resistant', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Trickery Domain', 'Serve the idea of deception, pranks, or more keeps the world moving', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'War Domain', 'Serve the idea of war, whether it''s war for honor or power.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Death Domain', 'Serve the idea of death; everything must eventually end.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Twilight Domain', 'Serve the idea of balance; those that attempt to disrupt it must be stopped.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Order Domain', 'Serve the idea of order and law; you are the voice of justice.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Forge Domain', 'Serve the idea of creation; the forges you touch will never fail', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Grave Domain', 'Serve the idea of life and death; the balance must be maintained', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Peace Domain', 'Serve the idea of peace; violence is almost never the answer.', (SELECT id FROM classes WHERE class_name = 'Cleric')),
    (gen_random_uuid(), 'Arcane Domain', 'Serve the idea of magic; magic is a power and a wonder', (SELECT id FROM classes WHERE class_name = 'Cleric'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Druid Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Circle of the Land', 'Grown within a certain biome, your power comes from there.', (SELECT id FROM classes WHERE class_name = 'Druid')),
    (gen_random_uuid(), 'Circle of the Moon', 'Like a werewolf, your power is based on changing forms.', (SELECT id FROM classes WHERE class_name = 'Druid')),
    (gen_random_uuid(), 'Circle of Dreams', 'The Feywild''s nature has blessed you with the power to heal.', (SELECT id FROM classes WHERE class_name = 'Druid')),
    (gen_random_uuid(), 'Circle of Shepherd', 'Like a shepherd, you protect the animals of the world.', (SELECT id FROM classes WHERE class_name = 'Druid')),
    (gen_random_uuid(), 'Circle of Spores', 'Mycelium has many uses and abilities, including raising the dead.', (SELECT id FROM classes WHERE class_name = 'Druid')),
    (gen_random_uuid(), 'Circle of Stars', 'The answer and guidance can always be found in the stars.', (SELECT id FROM classes WHERE class_name = 'Druid')),
    (gen_random_uuid(), 'Circle of Wildfire', 'Wildfires bring about change, ecosystems always revive.', (SELECT id FROM classes WHERE class_name = 'Druid'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Fighter Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Champion', 'Hone your martial ability into an incredibly deadly skill with constant crits.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Battle Master', 'Use the art of war and tactics to gain advantages and command to victory.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Eldritch Knight', 'Learning wizard-like spells to gain the upperhand in any fight.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Arcane Archer', 'Mix magic with your arrows to rain literal fire down upon your foes.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Cavalier', 'You will never break; your skill, while mounted or not, can not be beaten.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Samurai', 'Your fighting spirit will allow you to rain a hurricane of deadly blows.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Psi Warrior', 'Blessed with psychic energy, your mind is sharpened just like your weapon.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Rune Knight', 'Learn the ancient power of Giants and their powerful magic runes.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Echo Fighter', 'Using magical energy, create an "echo" to fight with you.', (SELECT id FROM classes WHERE class_name = 'Fighter')),
    (gen_random_uuid(), 'Purple Dragon Knight', 'A warrior that braves any battle through inspiration.', (SELECT id FROM classes WHERE class_name = 'Fighter'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Monk Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Way of the Open Hand', 'Use your fists and palms to annihilate your foe.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of the Shadow', 'Usually called, ninjas and so forth. Their fists strike from the shadow.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of the Four Elements', 'Control all 4 elements, earth, water, fire and wind in your ways.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of Mercy', 'Your ki and spirit is meant to heal wounds, not create them.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of the Astral Self', 'Your spirit becomes an entity around you to help you.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of the Drunken Master', 'Confuse your foes with unpredictable attacks.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of the Kensei', 'Your weapons become an extension of yourself. A form of art.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of the Sun Soul', 'Your soul and will is so powerful that it can ignite in fire.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of the Long Death', 'Your soul and fists become the tools of death.', (SELECT id FROM classes WHERE class_name = 'Monk')),
    (gen_random_uuid(), 'Way of the Ascendant Dragon', 'Following the way of dragons, your spirit manifests their power.', (SELECT id FROM classes WHERE class_name = 'Monk'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Paladin Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Oath of Devotion', 'Light, Lawful, Honesty, the pure holy warrior.', (SELECT id FROM classes WHERE class_name = 'Paladin')),
    (gen_random_uuid(), 'Oath of the Ancients', 'Joy and love, the ancients blessed this warrior with nature.', (SELECT id FROM classes WHERE class_name = 'Paladin')),
    (gen_random_uuid(), 'Oath of Vengeance', 'Anger and vengeance, something bad pushed this warrior to seek vengeance.', (SELECT id FROM classes WHERE class_name = 'Paladin')),
    (gen_random_uuid(), 'Oathbreaker', 'They broke an oath long ago and are cursed for it.', (SELECT id FROM classes WHERE class_name = 'Paladin')),
    (gen_random_uuid(), 'Oath of Conquest', 'Destruction and Victory, nothing will stop this warrior.', (SELECT id FROM classes WHERE class_name = 'Paladin')),
    (gen_random_uuid(), 'Oath of Redemption', 'A warrior that uses words instead of the sword.', (SELECT id FROM classes WHERE class_name = 'Paladin')),
    (gen_random_uuid(), 'Oath of Glory', 'A warrior that is destined for glory, fight for your destiny.', (SELECT id FROM classes WHERE class_name = 'Paladin')),
    (gen_random_uuid(), 'Oath of the Watchers', 'A warrior sworn to fight anything supernatural.', (SELECT id FROM classes WHERE class_name = 'Paladin')),
    (gen_random_uuid(), 'Oath of the Crown', 'A warrior that serves a crown or kingdom.', (SELECT id FROM classes WHERE class_name = 'Paladin'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Ranger Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Fey Wanderer', 'With the power of fey on their side, these rangers charm their foes.', (SELECT id FROM classes WHERE class_name = 'Ranger')),
    (gen_random_uuid(), 'Swarmkeeper', 'Insects, pixies or a similar swarm creature. These rangers take care of them.', (SELECT id FROM classes WHERE class_name = 'Ranger')),
    (gen_random_uuid(), 'Gloom Stalker', 'These hunters wander in the shadows to defeat creatures of the night.', (SELECT id FROM classes WHERE class_name = 'Ranger')),
    (gen_random_uuid(), 'Horizon Walker', 'These hunters seek out creatures from other worlds to end them.', (SELECT id FROM classes WHERE class_name = 'Ranger')),
    (gen_random_uuid(), 'Monster Slayer', 'These warriors hunt down to slay powerful monsters.', (SELECT id FROM classes WHERE class_name = 'Ranger')),
    (gen_random_uuid(), 'Hunter', 'A warrior who hones different parts of their fighting style to hunt.', (SELECT id FROM classes WHERE class_name = 'Ranger')),
    (gen_random_uuid(), 'Beast Master', 'A warrior who has gained the assistance of a spiritual beast.', (SELECT id FROM classes WHERE class_name = 'Ranger')),
    (gen_random_uuid(), 'Drakewarden', 'A warrior who has gained the assistance of a powerful drake that follows them.', (SELECT id FROM classes WHERE class_name = 'Ranger'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Rogue Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Thief', 'Thieves are rogues who are experts at breaking into things and stealing.', (SELECT id FROM classes WHERE class_name = 'Rogue')),
    (gen_random_uuid(), 'Assassin', 'Assassins are masters at killing while unseen.', (SELECT id FROM classes WHERE class_name = 'Rogue')),
    (gen_random_uuid(), 'Arcane Trickster', 'Tricksters mix magic into their skills, enhancing them.', (SELECT id FROM classes WHERE class_name = 'Rogue')),
    (gen_random_uuid(), 'Inquisitive', 'Like a detective, inquisitive rogues watch their targets and use their patterns.', (SELECT id FROM classes WHERE class_name = 'Rogue')),
    (gen_random_uuid(), 'Mastermind', 'These rogues are deadly smart, using their intelligence to fight.', (SELECT id FROM classes WHERE class_name = 'Rogue')),
    (gen_random_uuid(), 'Scout', 'Ambushing and Stealthing with speed, these rogues are always ahead.', (SELECT id FROM classes WHERE class_name = 'Rogue')),
    (gen_random_uuid(), 'Swashbuckler', 'Rogues that are fast and light on their feet, impossible to pin.', (SELECT id FROM classes WHERE class_name = 'Rogue')),
    (gen_random_uuid(), 'Phantom', 'Shadow magic is within the hearts of these rogues, stealing souls.', (SELECT id FROM classes WHERE class_name = 'Rogue')),
    (gen_random_uuid(), 'Soulknife', 'Blessed with a psychic mind, their roguish skills are enhanced.', (SELECT id FROM classes WHERE class_name = 'Rogue'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Sorcerer Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'Aberrant Mind', 'Cursed or blessed with a powerful psychic mind, their magic comes from their head.', (SELECT id FROM classes WHERE class_name = 'Sorcerer')),
    (gen_random_uuid(), 'Clockwork Soul', 'The balance of the universe flows through their veins.', (SELECT id FROM classes WHERE class_name = 'Sorcerer')),
    (gen_random_uuid(), 'Divine Soul', 'With blood from something Divine, gods watch them with interest.', (SELECT id FROM classes WHERE class_name = 'Sorcerer')),
    (gen_random_uuid(), 'Shadow Magic', 'Cursed with shadow magic, their power manipulates the shadows.', (SELECT id FROM classes WHERE class_name = 'Sorcerer')),
    (gen_random_uuid(), 'Storm Sorcery', 'With the blood of a powerful hurricane, storms are a comfort.', (SELECT id FROM classes WHERE class_name = 'Sorcerer')),
    (gen_random_uuid(), 'Draconic Bloodline', 'With the ancestors of dragons, they show draconic natures.', (SELECT id FROM classes WHERE class_name = 'Sorcerer')),
    (gen_random_uuid(), 'Wild Magic', 'The chaos of the universe flows through their veins.', (SELECT id FROM classes WHERE class_name = 'Sorcerer'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Warlock Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'The Archfey', 'A magical pact with an Archfey of the feywild.', (SELECT id FROM classes WHERE class_name = 'Warlock')),
    (gen_random_uuid(), 'The Fiend', 'A magical pact with a demonic or devilish entity.', (SELECT id FROM classes WHERE class_name = 'Warlock')),
    (gen_random_uuid(), 'The Great Old One', 'An ancient and powerful unknown entity from worlds beyond.', (SELECT id FROM classes WHERE class_name = 'Warlock')),
    (gen_random_uuid(), 'The Celestial', 'A magical pact with an entity of good, law, and order.', (SELECT id FROM classes WHERE class_name = 'Warlock')),
    (gen_random_uuid(), 'Undying', 'A magical pact with an entity that represents the dead.', (SELECT id FROM classes WHERE class_name = 'Warlock')),
    (gen_random_uuid(), 'The Hexblade', 'A magical pact with an entity that is or gifted a powerful weapon.', (SELECT id FROM classes WHERE class_name = 'Warlock')),
    (gen_random_uuid(), 'The Fathomless', 'A magical pact with a creature of the world''s deep oceans.', (SELECT id FROM classes WHERE class_name = 'Warlock')),
    (gen_random_uuid(), 'The Genie', 'A magical pact with a powerful elemental.', (SELECT id FROM classes WHERE class_name = 'Warlock')),
    (gen_random_uuid(), 'The Undead', 'A magical pact with a powerful deathless being that defies the cycle.', (SELECT id FROM classes WHERE class_name = 'Warlock'))
ON CONFLICT (subclass_name) DO NOTHING;

-- Wizard Subclasses --
INSERT INTO subclasses (id, subclass_name, subclass_description, class_id) VALUES
    (gen_random_uuid(), 'School of Abjuration', 'Study the defensive powers of magic.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Conjuration', 'Study the ways to control the creatures you summon.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Divination', 'Study the ways magic can show you the future and past.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Enchantment', 'Study the ways that magic can bend the minds of others.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Evocation', 'Study the ways that magic can destroy and offense.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Illusion', 'Study the ways that magic can make the eyes of others lie.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Necromancy', 'Study the forces of life and death.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Transmutation', 'Study the ways magic can shift reality.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Graviturgy', 'Study the ways magic can shift and manipulate gravity.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'School of Chronurgy', 'Study the ways magic can shift and bend time itself.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'War Magic', 'Study the ways magic can be used in combat and how it can be stored.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'Bladesinging', 'Study a tradition of wizardry that incorporates swordplay and dance.', (SELECT id FROM classes WHERE class_name = 'Wizard')),
    (gen_random_uuid(), 'Order of Scribes', 'Study the ways magic can be enhanced through books of power.', (SELECT id FROM classes WHERE class_name = 'Wizard'))
ON CONFLICT (subclass_name) DO NOTHING;