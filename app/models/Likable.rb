# A class to be inherited from in order to pass down key methods
# The base Like class should be uncontaminated since it's a model

class Likable < ApplicationRecord
    # get the raw like count on the object, likes are always in front
    def like_count
        [get_like_count(false) , get_like_count(true)]
    end

    # get the count and see if it includes the user
    def count_includes_user(user_id_to_check)
        {count: self.count , includes_user: Like.where(user_id: user_id_to_check , likable: self).count > 0}
    end

    private
    # return a count depeneding on the status of like / dislike
    def get_like_count(is_dislike_check = true)
        Like.where(likable: self , is_dislike: is_dislike_check).count
    end
end