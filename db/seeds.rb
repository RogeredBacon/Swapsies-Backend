# frozen_string_literal: true

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', location: "#{Faker::Address.latitude}, #{Faker::Address.longitude}")
end

20.times do
  Item.create(user: User.all[Faker::Number.between(from: 1, to: 10)], title: Faker::Commerce.product_name, subtitle: Faker::Lorem.sentence, description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: Faker::LoremFlickr.image, amount: Faker::Number.between(from: 1, to: 5))
end

20.times do
  Skill.create(user: User.all[Faker::Number.between(from: 1, to: 10)], title: Faker::Commerce.product_name, subtitle: Faker::Lorem.sentence, description: Faker::Lorem.sentence, worth_rating: Faker::Number.between(from: 1, to: 3), image: Faker::LoremFlickr.image, session_time: Faker::Number.between(from: 30, to: 120))
end

5.times do
  UserConversation.create(user: User.all[Faker::Number.between(from: 1, to: 5)], other_user: User.all[Faker::Number.between(from: 5, to: 10)])
end

10.times do
  Message.create(user_conversation: UserConversation.all[Faker::Number.between(from: 1, to: 5)], user: User.all[Faker::Number.between(from: 1, to: 10)], message: Faker::Lorem.paragraph)
end

10.times do
  TradeRequest.create(initiating_user: User.all[Faker::Number.between(from: 1, to: 5)], receiving_user: User.all[Faker::Number.between(from: 5, to: 10)], status: Faker::Lorem.word, initiator_complete: Faker::Boolean.boolean(true_ratio: 0.2), receiver_complete: Faker::Boolean.boolean(true_ratio: 0.2))
end

10.times do
  Rating.create(trade_request: TradeRequest.all[Faker::Number.between(from: 1, to: 10)], user: User.all[Faker::Number.between(from: 1, to: 10)], rating: Faker::Number.between(from: 1, to: 5), comment: Faker::Lorem.sentences)
end

10.times do
  TradeRequestItem.create(trade_request: TradeRequest.all[Faker::Number.between(from: 1, to: 10)], item: Item.all[Faker::Number.between(from: 1, to: 20)], locked: Faker::Boolean.boolean(true_ratio: 0.4), amount: Faker::Number.between(from: 1, to: 3))
end

10.times do
  TradeRequestSkill.create(trade_request: TradeRequest.all[Faker::Number.between(from: 1, to: 10)], skill: Skill.all[Faker::Number.between(from: 1, to: 20)], locked: Faker::Boolean.boolean(true_ratio: 0.4), amount: Faker::Number.between(from: 1, to: 3))
end
