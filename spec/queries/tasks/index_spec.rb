describe Tasks::Index, type: :query do
	describe 'get all tasks' do
		let!(:task) { FactoryBot.create(:task) }
		let!(:task_two) { FactoryBot.create(:task) }
		let!(:task_query) { Tasks::Index.new }

    context 'index' do
			it 'should get tasks array' do
				result = task_query.call(params: {})
				expect(result.success.first.title).to eq "Task Title 1"
				expect(result.success.first.class).to eq Task
				expect(result.success.size).to eq 2
			end
		end
	end
end
