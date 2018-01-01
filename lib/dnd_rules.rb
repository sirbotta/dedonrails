module DndRules

  LEVEL_TIERS = [300, 900, 2700, 6500]

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
      custom: {}
  }

  CLASSES = {
      fighter: {
          hitpoints: 10,
          saves: [
              'save_str',
              'save_cos'
          ],
          skills_max: 2,
          skills: [
              'acrobatics',
              'animal_handling',
              'athletics',
              'history',
              'insight',
              'intimidation',
              'perception',
              'survival'
          ],
          levels: {
              '1': {
                  features: [
                      'fighting_style',
                      'second_wind'
                  ]
              },
              '2': {
                  features: [
                      'action_surge'
                  ]
              },
              '3': {
                  features: [
                      'martial_archetype'
                  ]
              }
          }
      },
      cleric: {
          hitpoints: 8,
          saves: [
              'save_wis',
              'save_cha'
          ],
          skills_max: 2,
          skills: [
              'history',
              'insight',
              'medicine',
              'persuasion',
              'religion'
          ],
          levels: {
              '1': {
                  features: [
                      'spellcasting',
                      'divine_domain'
                  ]
              }
          }
      },
      rogue: {},
      wizard: {},
      custom: {},
  }

  ALIGNMENTS = {
      neutral: 'lol',
      lawful_neutral: 'loller',
      chaotic_neutral: 'loller',
      neutral_good: 'lol',
      lawful_good: 'loller',
      chaotic_good: 'loller',
      neutral_evil: 'lol',
      lawful_evil: 'loller',
      chaotic_evil: 'loller',
  }

  BACKGROUNDS = {
      acolitye: {
          skills: [
              'insight',
              'religion'
          ],
          features: [
              'shelter_of_the_faithful'
          ],
          personality_traits: [
              'I idolize a particular hero of my faith, and constantly refer to that person’s deeds and example.',
              'I can find common ground between the fiercest enemies, empathizing with them and always working toward peace.',
              'I see omens in every event and action. The gods try to speak to us, we just need to listen.',
              'Nothing can shake my optimistic attitude.',
              'I quote (or misquote) sacred texts and proverbs in almost every situation.',
              'I am tolerant (or intolerant) of other faiths and respect (or condemn) the worship of other gods.',
              'I’ve enjoyed fine food, drink, and high society among my temple’s elite. Rough living grates on me.',
              '	I’ve spent so long in the temple that I have little practical experience dealing with people in the outside world.'
          ],
          ideals: [
              'Tradition. The ancient traditions of worship and sacrifice must be preserved and upheld. (Lawful)'
          ],
          bonds:[
              'I would die to recover an ancient relic of my faith that was lost long ago.'
          ],
          flaws: [
              'I judge others harshly, and myself even more severely.'
          ],


      }
  }

end