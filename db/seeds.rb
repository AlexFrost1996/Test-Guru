# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: :User },
                       { name: :Lamer }
                     ])

categories = Categorie.create!([
                                 { title: :Frontend },
                                 { title: :Backend },
                                 { title: :Mobile }
                               ])

tests = Test.create!([
                       { title: :Rails, level: 2, category_id: categories[1].id },
                       { title: :Go, level: 1, category_id: categories[1].id },
                       { title: :JS, level: 2, category_id: categories[0].id },
                       { title: :iOS, level: 1, category_id: categories[2].id },
                       { title: :React, level: 2, category_id: categories[0].id }
                     ])

questions = Question.create!([
                               { body: 'What are you a natural at?', test_id: tests[0].id },
                               { body: "What's the worst movie you've ever seen?", test_id: tests[0].id },
                               { body: 'What talent would you show off in a talent show?', test_id: tests[0].id },
                               { body: 'Where did you last go on holiday?', test_id: tests[1].id },
                               { body: 'How healthy is your diet?', test_id: tests[1].id },
                               { body: 'Would you like to start your own company?', test_id: tests[1].id },
                               { body: "What's your perfect breakfast?", test_id: tests[2].id },
                               { body: 'What is your most treasured possession?', test_id: tests[2].id },
                               { body: "What's your least favourite type of weather?", test_id: tests[2].id },
                               { body: 'Do you read or watch TV in bed?', test_id: tests[3].id },
                               { body: 'Who is a famous actor from your country?', test_id: tests[3].id },
                               { body: 'What kind of books do you like to read?', test_id: tests[3].id },
                               { body: 'How far from here do you live?', test_id: tests[4].id },
                               { body: 'What modern gadget could you not live without?', test_id: tests[4].id },
                               { body: 'What position do you like to sleep in?', test_id: tests[4].id }
                             ])

answers = Answer.create!([
                           { body: 'He put heat on the wound to see what would grow.', correct: true,
                             question_id: questions[0].id },
                           { body: "It's a skateboarding penguin with a sunhat!", correct: false,
                             question_id: questions[0].id },
                           { body: 'Dan ate the clouds like cotton candy.', correct: false, question_id: questions[1].id },
                           { body: 'She looked into the mirror and saw another person.', correct: true,
                             question_id: questions[1].id },
                           { body: 'He is no James Bond; his name is Roger Moore.', correct: true,
                             question_id: questions[2].id },
                           { body: 'Today I dressed my unicorn in preparation for the race.', correct: false,
                             question_id: questions[2].id },
                           { body: 'When transplanting seedlings, candied teapots will make the task easier.',
                             correct: true, question_id: questions[3].id },
                           { body: 'I covered my friend in baby oil.', correct: false, question_id: questions[3].id },
                           { body: 'A glittering gem is not enough.', correct: true, question_id: questions[4].id },
                           { body: 'Cursive writing is the best way to build a race track.', correct: false,
                             question_id: questions[4].id },
                           { body: "He looked behind the door and didn't like what he saw.", correct: true,
                             question_id: questions[5].id },
                           { body: 'A good example of a useful vegetable is medicinal rhubarb.', correct: false,
                             question_id: questions[5].id },
                           { body: 'The knives were out and she was sharpening hers.', correct: true,
                             question_id: questions[6].id },
                           { body: "Standing on one's head at job interviews forms a lasting impression.",
                             correct: false, question: questions[6].id },
                           { body: 'He always wore his sunglasses at night.', correct: false, question_id: questions[7].id },
                           { body: 'The swirled lollipop had issues with the pop rock candy.', correct: true,
                             question_id: questions[7].id },
                           { body: 'The old rusted farm equipment surrounded the house predicting its demise.',
                             correct: true, question: questions[8].id },
                           { body: 'Shingle color was not something the couple had ever talked about.', correct: false,
                             question_id: questions[8].id },
                           { body: 'He was sure the Devil created red sparkly glitter.', correct: false,
                             question_id: questions[9].id },
                           { body: "I'm confused: when people ask me what's up, and I point, they groan.", correct: true,
                             question_id: questions[9].id },
                           { body: 'Never underestimate the willingness of the greedy to throw you under the bus.',
                             correct: false, question: questions[10].id },
                           { body: 'Plans for this weekend include turning wine into water.', correct: true,
                             question_id: questions[10].id },
                           { body: 'The doll spun around in circles in hopes of coming alive.', correct: true,
                             question_id: questions[11].id },
                           { body: 'Everybody should read Chaucer to improve their everyday vocabulary.', correct: false,
                             question_id: questions[11].id },
                           { body: 'The Great Dane looked more like a horse than a dog.', correct: true,
                             question_id: questions[12].id },
                           { body: 'The truth is that you pay for your lifestyle in hours.', correct: false,
                             question_id: questions[12].id },
                           { body: 'I want more detailed information.', correct: true, question_id: questions[13].id },
                           { body: 'So long and thanks for the fish.', correct: false, question_id: questions[13].id },
                           { body: 'He hated that he loved what she hated about hate.', correct: false,
                             question_id: questions[14].id },
                           { body: 'The pigs were insulted that they were named hamburgers.', correct: true,
                             question_id: questions[14].id }
                         ])

users_tests = UserTest.create!([ 
                                  { user_id: users[1].id, test_id: tests[1].id },
                                  { user_id: users[0].id, test_id: tests[2].id },
                                  { user_id: users[1].id, test_id: tests[3].id },
                                  { user_id: users[0].id, test_id: tests[4].id },
                                  { user_id: users[1].id, test_id: tests[0].id }
                                ])
