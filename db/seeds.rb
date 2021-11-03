# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([ { type: :Admin,
                         email: :'admin@test-guru.com',
                         password: ENV.fetch('ADMIN_PASSWORD'),
                         first_name: :'Boss',
                         last_name: :'Alex'
                       },
                       { type: :User,
                         email: :'user@test-guru.com',
                         password: ENV.fetch('USER_PASSWORD'),
                         first_name: :'Brighton',
                         last_name: :'Beach'
                       }
                       ])

users.each(&:confirm)

categories = Category.create!([
                                 { title: :Frontend },
                                 { title: :Backend },
                                 { title: :Mobile }
                               ])

tests = Test.create!([
                       { title: :Rails, level: 2, category: categories[1], creator: users[0] },
                       { title: :Go, level: 1, category: categories[1], creator: users[0] },
                       { title: :JS, level: 2, category: categories[0], creator: users[0] },
                       { title: :iOS, level: 1, category: categories[2], creator: users[0] },
                       { title: :React, level: 2, category: categories[0], creator: users[0] }
                     ])

questions = Question.create!([
                               { body: 'What are you a natural at?', test: tests[0] },
                               { body: "What's the worst movie you've ever seen?", test: tests[0] },
                               { body: 'What talent would you show off in a talent show?', test: tests[0] },
                               { body: 'Where did you last go on holiday?', test: tests[1] },
                               { body: 'How healthy is your diet?', test: tests[1] },
                               { body: 'Would you like to start your own company?', test: tests[1] },
                               { body: "What's your perfect breakfast?", test: tests[2] },
                               { body: 'What is your most treasured possession?', test: tests[2] },
                               { body: "What's your least favourite type of weather?", test: tests[2] },
                               { body: 'Do you read or watch TV in bed?', test: tests[3] },
                               { body: 'Who is a famous actor from your country?', test: tests[3] },
                               { body: 'What kind of books do you like to read?', test: tests[3] },
                               { body: 'How far from here do you live?', test: tests[4] },
                               { body: 'What modern gadget could you not live without?', test: tests[4] },
                               { body: 'What position do you like to sleep in?', test: tests[4] }
                             ])

answers = Answer.create!([
                           { body: 'He put heat on the wound to see what would grow.', correct: :true, question: questions[0] },
                           { body: "It's a skateboarding penguin with a sunhat!", correct: :false, question: questions[0] },
                           { body: 'Dan ate the clouds like cotton candy.', correct: :false, question: questions[1] },
                           { body: 'She looked into the mirror and saw another person.', correct: :true, question: questions[1] },
                           { body: 'He is no James Bond; his name is Roger Moore.', correct: :true, question: questions[2] },
                           { body: 'Today I dressed my unicorn in preparation for the race.', correct: :false, question: questions[2] },
                           { body: 'When transplanting seedlings, candied teapots will make the task easier.', correct: :true, question: questions[3] },
                           { body: 'I covered my friend in baby oil.', correct: :false, question: questions[3] },
                           { body: 'A glittering gem is not enough.', correct: :true, question: questions[4] },
                           { body: 'Cursive writing is the best way to build a race track.', correct: :false, question: questions[4] },
                           { body: "He looked behind the door and didn't like what he saw.", correct: :true, question: questions[5] },
                           { body: 'A good example of a useful vegetable is medicinal rhubarb.', correct: :false, question: questions[5] },
                           { body: 'The knives were out and she was sharpening hers.', correct: :true, question: questions[6] },
                           { body: "Standing on one's head at job interviews forms a lasting impression.", correct: :false, question: questions[6] },
                           { body: 'He always wore his sunglasses at night.', correct: :false, question: questions[7] },
                           { body: 'The swirled lollipop had issues with the pop rock candy.', correct: :true, question: questions[7] },
                           { body: 'The old rusted farm equipment surrounded the house predicting its demise.', correct: :true, question: questions[8] },
                           { body: 'Shingle color was not something the couple had ever talked about.', correct: :false, question: questions[8] },
                           { body: 'He was sure the Devil created red sparkly glitter.', correct: :false, question: questions[9] },
                           { body: "I'm confused: when people ask me what's up, and I point, they groan.", correct: :true, question: questions[9] },
                           { body: 'Never underestimate the willingness of the greedy to throw you under the bus.', correct: :false, question: questions[10] },
                           { body: 'Plans for this weekend include turning wine into water.', correct: :true, question: questions[10] },
                           { body: 'The doll spun around in circles in hopes of coming alive.', correct: :true, question: questions[11] },
                           { body: 'Everybody should read Chaucer to improve their everyday vocabulary.', correct: :false, question: questions[11]},
                           { body: 'The Great Dane looked more like a horse than a dog.', correct: :true, question: questions[12] },
                           { body: 'The truth is that you pay for your lifestyle in hours.', correct: :false, question: questions[12] },
                           { body: 'I want more detailed information.', correct: :true, question: questions[13] },
                           { body: 'So long and thanks for the fish.', correct: :false, question: questions[13] },
                           { body: 'He hated that he loved what she hated about hate.', correct: :false, question: questions[14] },
                           { body: 'The pigs were insulted that they were named hamburgers.', correct: :true, question: questions[14] }
                         ])

tests_users = TestPassage.create!([ { user: users[1], test: tests[1] },
                                    { user: users[0], test: tests[2] },
                                    { user: users[1], test: tests[3] },
                                    { user: users[0], test: tests[4] },
                                    { user: users[1], test: tests[0] }
                                  ])