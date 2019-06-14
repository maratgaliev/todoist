describe Tags::UpdateCommand do
  
  let(:command) { described_class.new }

  context 'update tag' do
		it 'should return updated tag' do
			tag = FactoryBot.create(:tag)
			hash = {"title": "Tag"}
			result = command.call(id: tag.id, params: hash)
      expect(result.success.title).to eq(hash[:title])
    end

		it 'should not update tag without title' do
			hash = {"title": ""}
			tag = FactoryBot.create(:tag)
			result = command.call(id: tag.id, params: hash)
      expect(result.failure[:title]).to eq(['must be filled'])
		end

		it 'should not update tag with invalid id' do
			hash = {"title": "Tag"}
			result = command.call(id: -1, params: hash)
      expect(result.failure[:message]).to eq(['Tag not found'])
		end
  end
end