# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# create one API client to provide an authorization example
Client.delete_all
Client.create! email: 'challenge@aroundhome.de', password: 'challenge_accepted'

# create sample materials
Material.delete_all
Material.create! name: 'wood'
Material.create! name: 'carpet'
Material.create! name: 'tiles'
materials = Material.all

MaterialRelation.delete_all

# create sample partners to match requests with
Partner.delete_all
Faker::Config.locale = :de
50.times do |_|
  partner = Partner.create!(
    name: Faker::Company.name,
    latitude: Faker::Number.within(range: 47.40724..54.9079).round(6),
    longitude: Faker::Number.within(range: 5.98815..14.98853).round(6),
    operating_radius: Faker::Number.between(from: 1.0, to: 100.0).round(3),
    rating: Faker::Number.between(from: 0.0, to: 10.0).round(2)
  )
  materials.sample(rand(1..materials.size)).each do |material|
    partner.material_relations.create!(material:)
  end
end
