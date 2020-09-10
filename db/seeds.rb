# frozen_string_literal: true

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', location: "#{Faker::Address.latitude}, #{Faker::Address.longitude}")
end

Item.create(user: User.all[Faker::Number.between(from: 1, to: 3)], title: 'Apples', subtitle: 'Fresh from the garden', description: 'From our tree in the garden and freshly picked.', worth_rating: 1, image: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80', amount: 20)
Item.create(user: User.all[Faker::Number.between(from: 1, to: 3)], title: 'Used Laptop', subtitle: '2 Year old Macbook', description: 'This is in perfect condition and weve already wiped it', worth_rating: 3, image: 'https://www.gravis.de/out/pictures/z1/apple-macbook-air-retina-13-326quot-i5-1-6-ghz-8-gb-ram-256-gb-ssd-space-grau_z1.jpg', amount: 2)
Item.create(user: User.all[Faker::Number.between(from: 1, to: 3)], title: 'Hand Sanitiser', subtitle: 'Unopened from Boots', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://i5.walmartimages.com/asr/8302dcba-d0f7-47a7-af41-39dc60159e14_1.41a3b9a2554e740d25eca99681bd33f7.jpeg', amount: Faker::Number.between(from: 2, to: 5))
Item.create(user: User.all[Faker::Number.between(from: 1, to: 3)], title: 'New Shoes', subtitle: 'Nike, only worn once', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://i.etsystatic.com/11017616/r/il/224ffd/1303359064/il_570xN.1303359064_4wrr.jpg', amount: Faker::Number.between(from: 2, to: 5))
Item.create(user: User.all[Faker::Number.between(from: 1, to: 2)], title: 'Backpack', subtitle: 'Good for commuting', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://cdn1.static-tgdp.com/ui/productimages/approved/std.lang.all/40/96/634096_sized_1800x1200_rev_1.jpg', amount: Faker::Number.between(from: 2, to: 5))
Item.create(user: User.all[Faker::Number.between(from: 1, to: 2)], title: 'Car', subtitle: '5 Years old', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Toyota_Crown_Athlete_aka_Toyota_Crown_%28S170%29_declared_manufactured_2002_registered_in_UK_May_2019_2500cc_per_dvla.jpg/1200px-Toyota_Crown_Athlete_aka_Toyota_Crown_%28S170%29_declared_manufactured_2002_registered_in_UK_May_2019_2500cc_per_dvla.jpg', amount: Faker::Number.between(from: 2, to: 5))
20.times do
  Item.create(user: User.all[Faker::Number.between(from: 1, to: 5)], title: Faker::Commerce.product_name, subtitle: Faker::Lorem.sentence, description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: Faker::LoremFlickr.image, amount: Faker::Number.between(from: 2, to: 5))
end

Skill.create(user: User.all[Faker::Number.between(from: 1, to: 2)], title: 'Photography Session', subtitle: 'Professional Photographer', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://i.ytimg.com/vi/LadtgYRxSos/maxresdefault.jpg', session_time: Faker::Number.between(from: 30, to: 120))
Skill.create(user: User.all[Faker::Number.between(from: 1, to: 2)], title: 'CV Help', subtitle: 'Careers Coach', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://www.careersenhanced.com/wp-content/uploads/2014/04/Career-coach-word-cloud3.jpg', session_time: Faker::Number.between(from: 30, to: 120))
Skill.create(user: User.all[Faker::Number.between(from: 1, to: 2)], title: 'Cooking Lesson', subtitle: 'My husband likes my cooking', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://phoenixchefdelivery.com/wp-content/uploads/2015/09/Cooking-Courses-Cookery-Classes-Cookery-Lessons-Cookery-School.jpg', session_time: Faker::Number.between(from: 30, to: 120))
Skill.create(user: User.all[Faker::Number.between(from: 1, to: 2)], title: 'Web Dev 101', subtitle: 'I work for Google', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://miro.medium.com/max/920/1*Gj3o25NkCWU1xy7wej_l7w.png', session_time: Faker::Number.between(from: 30, to: 120))
Skill.create(user: User.all[Faker::Number.between(from: 1, to: 2)], title: 'Cleaning', subtitle: 'Scrub those Corona stains away', description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: 'https://longhollow.com/wp-content/uploads/2017/11/Bucket-of-cleaning-tools.jpg', session_time: Faker::Number.between(from: 30, to: 120))

20.times do
  Skill.create(user: User.all[Faker::Number.between(from: 1, to: 5)], title: Faker::Commerce.product_name, subtitle: Faker::Lorem.sentence, description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: Faker::LoremFlickr.image, session_time: Faker::Number.between(from: 30, to: 120))
end

5.times do
  UserConversation.create(user: User.all[Faker::Number.between(from: 1, to: 3)], other_user: User.all[Faker::Number.between(from: 3, to: 5)])
end

10.times do
  Message.create(user_conversation: UserConversation.all[Faker::Number.between(from: 1, to: 5)], user: User.all[Faker::Number.between(from: 1, to: 5)], message: Faker::Lorem.paragraph)
end

TradeRequest.create(initiating_user: User.all[Faker::Number.between(from: 1, to: 5)], receiving_user: User.all[Faker::Number.between(from: 1, to: 5)], status: Faker::Lorem.word, initiator_finalised: Faker::Boolean.boolean(true_ratio: 0.5), receiver_finalised: Faker::Boolean.boolean(true_ratio: 0.5), initiator_complete: Faker::Boolean.boolean(true_ratio: 0.5), receiver_complete: Faker::Boolean.boolean(true_ratio: 0.5))
TradeRequest.create(initiating_user: User.all[Faker::Number.between(from: 1, to: 5)], receiving_user: User.all[Faker::Number.between(from: 1, to: 5)], status: Faker::Lorem.word,  initiator_finalised: Faker::Boolean.boolean(true_ratio: 0.5), receiver_finalised: Faker::Boolean.boolean(true_ratio: 0.5), initiator_complete: Faker::Boolean.boolean(true_ratio: 0.5), receiver_complete: Faker::Boolean.boolean(true_ratio: 0.5))
TradeRequest.create(initiating_user: User.all[Faker::Number.between(from: 1, to: 5)], receiving_user: User.all[Faker::Number.between(from: 1, to: 5)], status: Faker::Lorem.word,  initiator_finalised: Faker::Boolean.boolean(true_ratio: 0.5), receiver_finalised: Faker::Boolean.boolean(true_ratio: 0.5), initiator_complete: Faker::Boolean.boolean(true_ratio: 0.5), receiver_complete: Faker::Boolean.boolean(true_ratio: 0.5))
TradeRequest.create(initiating_user: User.all[Faker::Number.between(from: 1, to: 5)], receiving_user: User.all[Faker::Number.between(from: 1, to: 5)], status: Faker::Lorem.word,  initiator_finalised: Faker::Boolean.boolean(true_ratio: 0.5), receiver_finalised: Faker::Boolean.boolean(true_ratio: 0.5), initiator_complete: Faker::Boolean.boolean(true_ratio: 0.5), receiver_complete: Faker::Boolean.boolean(true_ratio: 0.5))
TradeRequest.create(initiating_user: User.all[Faker::Number.between(from: 1, to: 5)], receiving_user: User.all[Faker::Number.between(from: 1, to: 5)], status: Faker::Lorem.word,  initiator_finalised: Faker::Boolean.boolean(true_ratio: 0.5), receiver_finalised: Faker::Boolean.boolean(true_ratio: 0.5), initiator_complete: Faker::Boolean.boolean(true_ratio: 0.5), receiver_complete: Faker::Boolean.boolean(true_ratio: 0.5))

10.times do
  TradeRequest.create(initiating_user: User.all[Faker::Number.between(from: 1, to: 5)], receiving_user: User.all[Faker::Number.between(from: 1, to: 5)], status: Faker::Lorem.word, initiator_finalised: Faker::Boolean.boolean(true_ratio: 0.5), receiver_finalised: Faker::Boolean.boolean(true_ratio: 0.5), initiator_complete: Faker::Boolean.boolean(true_ratio: 0.2), receiver_complete: Faker::Boolean.boolean(true_ratio: 0.2))
end

10.times do
  Rating.create(trade_request: TradeRequest.all[Faker::Number.between(from: 1, to: 10)], user: User.all[Faker::Number.between(from: 1, to: 5)], rating: Faker::Number.between(from: 1, to: 5), comment: Faker::Lorem.sentences)
end

10.times do
  TradeRequestItem.create(trade_request: TradeRequest.all[Faker::Number.between(from: 1, to: 10)], item: Item.all[Faker::Number.between(from: 1, to: 20)], locked: Faker::Boolean.boolean(true_ratio: 0.4), amount: Faker::Number.between(from: 1, to: 3))
end

10.times do
  TradeRequestSkill.create(trade_request: TradeRequest.all[Faker::Number.between(from: 1, to: 10)], skill: Skill.all[Faker::Number.between(from: 1, to: 20)], locked: Faker::Boolean.boolean(true_ratio: 0.4), amount: Faker::Number.between(from: 1, to: 3))
end
