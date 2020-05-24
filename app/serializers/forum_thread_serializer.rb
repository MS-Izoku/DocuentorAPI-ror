class ForumThreadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content
end
