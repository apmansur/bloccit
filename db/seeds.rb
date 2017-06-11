require 'random_data'

 # Create an admin user
  admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )

 
 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )

  # Create Users
  5.times do
    User.create!(
     name: RandomData.random_name,
     email: RandomData.random_email,
     password: RandomData.random_sentence
     )
  end
 users = User.all

  # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all
 
  # Create Advertisements
 10.times do
 
   Advertisement.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  rand(10..100)
   )
 end
 

  # Create Posts
 50.times do
 
   Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
   # Create Questions
 10.times do
 
   Question.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     resolved:  [true, false].sample
   )
 end

 
 # Create Comments
 
 100.times do
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 
 # Create Unique Post to test for idempotence
 
 Post.find_or_create_by!(
     
     title: "unique post",
     body: "unique body"
     
    )

 
   user = User.first
   user.update_attributes!(
   email: 'youremail.com', # replace this with your personal email
   password: 'helloworld'
 )



 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"
 puts "#{User.count} users created"
