module UsersHelper
   def user_has_posts?
       current_user.posts != []
   end
   
   def user_has_favorites?
       current_user.favorites != []
   end
end
