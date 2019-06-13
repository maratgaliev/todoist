describe Tasks::DestroyCommand do
  
  let(:command) { described_class.new }

  context 'destroy task' do
		it 'should destroy task' do
			task = FactoryBot.create(:task)
			result = command.call(id: task.id)
      expect(result.success).to eq(:deleted)
    end

		it 'should not destroy task with invalid id' do
			result = command.call(id: -1)
      expect(result.failure[:message]).to eq(['Task not found'])
		end
  end
end