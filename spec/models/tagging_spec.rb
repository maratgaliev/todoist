require 'rails_helper'

describe Tagging, type: :model do
  it 'belongs to task' do
    relation = described_class.reflect_on_association(:task)
    expect(relation.macro).to eq :belongs_to
	end
	
	it 'belongs to tag' do
    relation = described_class.reflect_on_association(:tag)
    expect(relation.macro).to eq :belongs_to
  end
end