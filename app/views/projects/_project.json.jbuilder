json.extract! project, :id, :name, :description, :location, :pictures_goal, :project_picture, :created_at, :updated_at
json.url project_url(project, format: :json)
