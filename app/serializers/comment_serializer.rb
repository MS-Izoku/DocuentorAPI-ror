class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :content
end
