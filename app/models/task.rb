class Task < ApplicationRecord
	has_many :taggings
  has_many :tags, through: :taggings

	scope :ordered, -> { order(created_at: :asc) }

	def self.tagged_with(name)
    Tag.find_by!(name: name).articles
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

	def tags=(array)
		array.each do |tag|
			tag = Tag.where(name: tag.strip).first_or_create!
			Tagging.where(tag: tag, task: self).first_or_create!
		end
  end
end
