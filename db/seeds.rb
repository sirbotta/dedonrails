# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(first_name: 'Simone',last_name: 'Bottecchia', email: 'hipersimon@gmail.com')
user.password = 'simone'
user.password_confirmation = 'simone'
user.save

adventure = Adventure.create(title: 'Avventura 1', sub_title: 'Avventura di prova', dm_id: user.id)

party  = adventure.build_party(name: 'Party di prova', max_members: 3)
party.save

character = party.characters.build(name: 'Simoncello', str: 14, dex: 12, cos: 15, int: 11, wis:13, cha: 13, user_id: user.id, dnd_background: 'acolyte')
character.save

act = adventure.acts.build(title: "Atto 1", text: 'Atto di prova')
act.save

chapter = act.chapters.build(title: 'Capitolo 1', text: 'Capitolo di prova')
chapter.save

