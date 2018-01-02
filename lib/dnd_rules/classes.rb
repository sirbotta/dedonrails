module DndRules
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
end