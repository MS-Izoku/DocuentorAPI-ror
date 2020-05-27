module Likable
    # get either likes or dislikes count on an object
    def like_count(likable_object = self , is_dislike)
        likes = Like.where(likable: likable_object , is_dislike: is_dislike)      
        return 0 if likes == nil
        likes.count
    end

    def user_has_liked?(likable_object = self , user_id)
        likable_object.where(user_id: user_id) ? true : false
    end

    # get both the like and dislike total of an object
    def like_totals(likable_object = self)
        {
            count: [like_count(likable_object , false) , like_count(likable_object , true)] ,
            user_has_liked: user_has_liked?
        }
    end
end