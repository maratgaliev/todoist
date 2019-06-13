class Task < ApplicationRecord
	has_many :taggings
  has_many :tags, through: :taggings

	def self.tagged_with(name)
    Tag.find_by!(name: name).tasks
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

	def tags=(array)
		array.each do |tag|
			tag = Tag.where(name: tag.strip).first_or_create!
			self.tags << tag
		end
  end
end
