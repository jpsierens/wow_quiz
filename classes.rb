# frozen_string_literal: true

CLASSES = %w[priest paladin monk demonhunter deathknight shaman mage warlock hunter rogue
             druid].freeze

CLASS_HINTS = {
  'priest' => 'Heals you with holy light, but can also mess up your mind when angry',
  'paladin' => 'A warrior of the light, may or may not pop you in 1 second',
  'monk' => 'One with the zen, this fighter doesnt even need a weapon to kick your ass',
  'demonhunter' => 'Follower of Illidan, experts at hunting a specific type of evil',
  'deathknight' => 'Dead but still fighting',
  'shaman' => 'One with the elements',
  'mage' => 'choose your school of magic, this caster can pop you in any',
  'warlock' => 'raises terrible things from beyond and likes delving into old dark tomes',
  'hunter' => 'A wild one, can track anything and has companions, furry ones',
  'rogue' => 'quick, behind you or he might back stab you',
  'druid' => 'is that a cat? wait why is it now a bear? ohh its a...'
}.freeze
