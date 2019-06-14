describe Tags::CreateCommand do
  
  let(:command) { described_class.new }

  context 'create tag' do
		it 'should return created tag' do
			hash = {"title": "Tag"}
			result = command.call(params: hash)
      expect(result.success.class).to eq(Tag)
		end

		it 'should not create tag without title' do
			hash = {"title": ""}
			result = command.call(params: hash)
      expect(result.failure[:title]).to eq(['must be filled'])
		end
	end
end