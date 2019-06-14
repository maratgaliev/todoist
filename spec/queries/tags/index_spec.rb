describe Tags::Index, type: :query do
	describe 'get all tags' do
		let!(:tag) { FactoryBot.create(:tag) }
		let!(:tag_two) { FactoryBot.create(:tag) }
		let!(:tag_query) { Tags::Index.new }

    context 'index' do
			it 'should get tags array' do
				result = tag_query.call(params: {})
				expect(result.success.first.title).to include "Tag Title"
				expect(result.success.first.class).to eq Tag
				expect(result.success.size).to eq 2
			end

			it 'should get paginated array' do
				11.times {FactoryBot.create(:tag)}
				result = tag_query.call(params: {})
				expect(result.success.size).to eq 10
			end
		end
	end
end
