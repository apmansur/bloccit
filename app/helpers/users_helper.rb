module UsersHelper
   def user_has_posts?
        current_user.posts?
   end
end
