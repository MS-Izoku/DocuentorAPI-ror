class DocumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :summary, :project_id
end
