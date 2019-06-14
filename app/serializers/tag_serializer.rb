class TagSerializer < ActiveModel::Serializer
	attributes :id, :ctitle, :created_at

	def ctitle
		object.title
	end
end