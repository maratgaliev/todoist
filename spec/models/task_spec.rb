require 'rails_helper'

describe Task, type: :model do
	
	subject { described_class }

  it 'has many taggings' do
    relation = subject.reflect_on_association(:taggings)
    expect(relation.macro).to eq :has_many
	end

	it 'has many tags' do
    relation = subject.reflect_on_association(:tags)
    expect(relation.macro).to eq :has_many
	end

	it 'should not add any tags by default' do
    expect(subject.new.tags.size).to eq 0
	end

	it 'should add tags via tags method' do
		task = FactoryBot.create(:task, tags: ["one", "two"])
    expect(task.tags.size).to eq 2
	end

	it 'should return tag list as string' do
		task = FactoryBot.create(:task, tags: ["one", "two"])
    expect(task.tag_list).to eq 'one, two'
	end

	it 'should return tagged tasks' do
		task = FactoryBot.create(:task, tags: ["one", "two"])
		task_two = FactoryBot.create(:task, tags: ["two"])
		task_three = FactoryBot.create(:task, tags: ["three", "four"])
		expect(Task.tagged_with("two").size).to eq 2
		expect(Task.tagged_with("two").first.id).to eq task.id
  end
end