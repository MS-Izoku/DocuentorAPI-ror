class ProjectUpdateSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :project_id, :updatable_id, :updatable_type, :report_number, :report_content
end
