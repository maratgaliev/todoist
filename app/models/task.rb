class Task < ApplicationRecord
	has_many :taggings
  has_many :tags, through: :taggings

	def self.tagged_with(title)
    Tag.find_by!(title: title).tasks
  end

  def tag_list
    tags.map(&:title).join(', ')
  end

	def tags=(array)
		array.each do |tag|
			tag = Tag.where(title: tag.strip).first_or_create!
			self.tags << tag
		end
  end
end
