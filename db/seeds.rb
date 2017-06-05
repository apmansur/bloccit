require 'random_data'

  # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 50.times do
 
   Post.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
  # Create Advertisements
 10.times do
 
   Advertisement.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  rand(10..100)
   )
 end
 
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

     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 # Create Unique Post to test for idempotence
 
 Post.find_or_create_by!(
     
     title: "unique post",
     body: "unique body"
     
    )

 
   # Create Sponsered Posts
 50.times do
 
   Sponsered.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  rand(10..100)
   )
 end
 

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"
 puts "#{Sponsered.count} sponsered posts created"
