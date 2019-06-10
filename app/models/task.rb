class Task < ApplicationRecord
	acts_as_taggable
	scope :ordered, -> { order(created_at: :desc) }
end
