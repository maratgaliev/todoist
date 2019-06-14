describe Tags::DestroyCommand do
  
  let(:command) { described_class.new }

  context 'destroy tag' do
		it 'should destroy tag' do
			tag = FactoryBot.create(:tag)
			result = command.call(id: tag.id)
      expect(result.success).to eq(:deleted)
    end

		it 'should not destroy tag with invalid id' do
			result = command.call(id: -1)
      expect(result.failure[:message]).to eq(['Tag not found'])
		end
  end
end