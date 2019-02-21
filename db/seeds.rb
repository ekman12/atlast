# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PLACE_PHOTOS = [
'https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1521017432531-fbd92d768814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
'https://images.unsplash.com/photo-1533777857889-4be7c70b33f7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
'https://images.unsplash.com/photo-1525610553991-2bede1a236e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
'https://images.unsplash.com/photo-1428515613728-6b4607e44363?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
'https://images.unsplash.com/photo-1515668236457-83c3b8764839?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
'https://images.unsplash.com/photo-1491960693564-421771d727d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=60',
'https://images.unsplash.com/photo-1531973968078-9bb02785f13d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60',
'https://images.unsplash.com/photo-1517638851339-a711cfcf3279?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60',
'https://images.unsplash.com/photo-1528605248644-14dd04022da1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60',
'https://images.unsplash.com/photo-1506833345857-935a8275b07a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60',
'https://images.unsplash.com/photo-1468072114808-903e572b8ead?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60',
'https://images.unsplash.com/photo-1416453072034-c8dbfa2856b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60',
'https://images.unsplash.com/photo-1483965907773-04d18dd757c9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60',
'https://images.unsplash.com/photo-1485182708500-e8f1f318ba72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60',
'https://images.unsplash.com/photo-1515215316771-2742baa337f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60'
]

p 'deleting previous seeds'

PostTag.delete_all
Tag.delete_all
Post.delete_all
User.delete_all
Place.delete_all
UserRelationship.delete_all

p 'deleted seeds'

p '-----'

p 'creating 20 users'

10.times do
  user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        picture: "https://randomuser.me/api/portraits/#{['wo',''].sample}men/#{(0..99).to_a.sample}.jpg",
        username: Faker::Internet.username,
        email: Faker::Internet.unique.email,
        password: "123456"
      )
  user.save!
end

p 'created 10 users'
p '-----'
p 'creating 10 places'

10.times do
  place = Place.new(
    name: Faker::Restaurant.name,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    country: Faker::Address.country,
    city: Faker::Address.city,
    neighbourhood: Faker::Address.community,
    address: Faker::Address.full_address
    )
  place.save!
  (1..10).to_a.sample.times do
    post = Post.new(
      note: Faker::Restaurant.review,
      photo: PLACE_PHOTOS.sample,
      user: User.all.sample,
      place: place
      )
    post.save!
  end
end

p 'created 10 places'
p '-----'
p 'creating 30 posts'


p 'created 30 posts'
p '-----'
p 'creating all tags'

cafe = Tag.new(
  tag_type: 'venue',
  name: 'cafe'
  )
cafe.save!

bar = Tag.new(
  tag_type: 'venue',
  name: 'bar'
  )

bar.save!

restaurant = Tag.new(
  tag_type: 'venue',
  name: 'restaraunt'
  )
restaurant.save!

pub = Tag.new(
  tag_type: 'venue',
  name: 'pub'
  )
pub.save!

breakfast = Tag.new(
  tag_type: 'meal',
  name: 'breakfast'
  )
breakfast.save!

brunch = Tag.new(
  tag_type: 'meal',
  name: 'brunch'
  )
brunch.save!

lunch = Tag.new(
  tag_type: 'meal',
  name: 'lunch'
  )
lunch.save!

dinner = Tag.new(
  tag_type: 'meal',
  name: 'dinner'
  )
dinner.save!

dessert = Tag.new(
  tag_type: 'meal',
  name: 'dessert'
  )
dessert.save!

coffee = Tag.new(
  tag_type: 'meal',
  name: 'coffee'
  )
coffee.save!

chilled = Tag.new(
  tag_type: 'vibe',
  name: 'chilled'
  )
chilled.save!

busy = Tag.new(
  tag_type: 'vibe',
  name: 'busy'
  )
busy.save!

elegant = Tag.new(
  tag_type: 'vibe',
  name: 'elegant'
  )
elegant.save!

organic = Tag.new(
  tag_type: 'food',
  name: 'organic'
  )
organic.save!

vegetarian = Tag.new(
  tag_type: 'food',
  name: 'vegetarian'
  )
vegetarian.save!

vegan = Tag.new(
  tag_type: 'food',
  name: 'vegan'
  )
vegan.save!

exotic = Tag.new(
  tag_type: 'food',
  name: 'exotic'
  )
exotic.save!

small_plates = Tag.new(
  tag_type: 'food',
  name: 'small plates'
  )
small_plates.save!

family = Tag.new(
  tag_type: 'good_for',
  name: 'family'
  )
family.save!

dates = Tag.new(
  tag_type: 'good_for',
  name: 'dates'
  )
dates.save!

working = Tag.new(
  tag_type: 'good_for',
  name: 'working'
  )
working.save!

drinks = Tag.new(
  tag_type: 'good_for',
  name: 'drinks'
  )
drinks.save!

p 'tags created'
p '-----'

p 'creating 60 post_tags'


60.times do
post_tag = PostTag.new(
  tag: Tag.all.sample,
  post: Post.all.sample,
  )
post_tag.save!
end

p 'created 60 post_tags'
p '-----'
p 'creating followers / followed relationship'

40.times do
  followed = User.all.sample
  follower = User.where.not(id: followed.id).sample
  relationship = UserRelationship.new(follower: follower, followed: followed)
  relationship.save! if UserRelationship.where(follower_id: follower.id, followed_id: followed.id).empty?
end

p 'created!'







