class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :title, :summary
end
