describe Tasks::CreateCommand do
  
  let(:command) { described_class.new }

  context 'create task' do
		it 'should return created task' do
			hash = {"title": "Do Homework"}
			result = command.call(params: hash)
      expect(result.success.class).to eq(Task)
		end
		
		it 'should return created task' do
			hash = {"title": "Do Homework", "tags": ["one", "two"]}
			result = command.call(params: hash)
      expect(result.success.class).to eq(Task)
    end

		it 'should not create task without title' do
			hash = {"title": ""}
			result = command.call(params: hash)
      expect(result.failure[:title]).to eq(['must be filled'])
		end
	end
end