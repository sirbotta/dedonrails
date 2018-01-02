module DndRules
  RACES = {
      human: {
          abilities: {
              str: 1,
              dex: 1,
              cos: 1,
              int: 1,
              wis: 1,
              cha: 1,
          },
          features: [
              'exemplars_of_ambition'
          ],
          languages: [
              'common',
          ]
      },
      high_elf: {
          abilities: {
              dex: 2,
              int: 1
          },
          features: [
              'darkvision',
              'keen_senses',
              'fey_ancestry',
              'trance',
              'elf_weapon_training',
              'elf_cantrip',
              'extra_language'
          ],
          languages: [
              'common',
              'elvish'
          ]

      },
      hill_dwarf: {
          abilities: {
              cos: 2,
              wis: 1
          },
          features: [
              'darkvision',
              'dwarven_resilience',
              'dwarven_combat_training',
              'dwarven_toughness',
              'stonecunning',
          ],
          languages: [
              'common',
              'dwarvish'
          ]

      },
      half_orc: {
          abilities: {
              str: 2,
              cos: 1
          },
          features: [
              'darkvision',
              'menacing',
              'relentless_endurance',
              'savage_attacks'
          ],
          languages: [
              'common',
              'orchish'
          ]

      },
      custom: {}
  }
end