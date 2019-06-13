describe Tasks::UpdateCommand do
  
  let(:command) { described_class.new }

  context 'update task' do
		it 'should return updated task' do
			task = FactoryBot.create(:task)
			hash = {"title": "Do Homework"}
			result = command.call(id: task.id, params: hash)
      expect(result.success.title).to eq(hash[:title])
    end

		it 'should not update task without title' do
			hash = {"title": ""}
			task = FactoryBot.create(:task)
			result = command.call(id: task.id, params: hash)
      expect(result.failure[:title]).to eq(['must be filled'])
		end

		it 'should not update task with invalid id' do
			hash = {"title": "Do Homework"}
			result = command.call(id: -1, params: hash)
      expect(result.failure[:message]).to eq(['Task not found'])
		end
  end
end