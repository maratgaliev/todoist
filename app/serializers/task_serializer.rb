class TaskSerializer < ActiveModel::Serializer
	attributes :id, :title, :created_at
	has_many :tags
end