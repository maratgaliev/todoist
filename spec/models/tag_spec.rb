require 'rails_helper'

describe Tag, type: :model do
  it 'has many tasks' do
    relation = described_class.reflect_on_association(:tasks)
    expect(relation.macro).to eq :has_many
	end
	
	it 'has many taggings' do
    relation = described_class.reflect_on_association(:taggings)
    expect(relation.macro).to eq :has_many
  end
end