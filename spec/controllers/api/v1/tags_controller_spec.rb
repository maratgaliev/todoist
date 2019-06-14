describe Api::V1::TagsController, type: :request do
	
	describe 'GET /tags/index' do
		let!(:tag) { FactoryBot.create(:tag) }
		let!(:tag_two) { FactoryBot.create(:tag) }

    before do
      headers = { 'Content-Type' => 'application/json' }
      get '/api/v1/tags', headers: headers
    end

    subject { response }

    context 'index' do
			its(:status) { is_expected.to eq 200 }
			its(:body) { is_expected.to match /tag/ }
			
			it 'should not create user' do
				expect(Tag.count).to eq 2
			end
		end
		
	end
	
	describe 'POST /tags' do
    let(:title) { 'My tag' }

    before do
      headers = { 'Content-Type' => 'application/json' }
			params = {"data": { "attributes": {"title": title}} }
      post '/api/v1/tags', headers: headers, params: params.to_json
    end

    subject { response }

    context 'invalid payload' do
      let(:title) { '' }

      its(:status) { is_expected.to eq 422 }
      its(:body) { is_expected.to eq '{"errors":{"title":["must be filled"]}}' }
    end

    context 'valid credentials' do
      its(:status) { is_expected.to eq 200 }
			its(:body) { is_expected.to match /tag/ }
			
			it 'should create tag' do
				expect(Tag.count).to eq 1
			end
    end
	end
	
	describe 'PATCH /tags' do
		let(:title) { 'New tag title' }
		let!(:tag) { FactoryBot.create(:tag) }

    before do
      headers = { 'Content-Type' => 'application/json' }
			params = {"data": { "attributes": {"title": title}} }
      patch "/api/v1/tags/#{tag.id}", headers: headers, params: params.to_json
    end

    subject { response }

    context 'invalid payload' do
      let(:title) { '' }
      its(:status) { is_expected.to eq 422 }
			its(:body) { is_expected.to eq '{"errors":{"title":["must be filled"]}}' }
    end

    context 'valid credentials' do
      its(:status) { is_expected.to eq 200 }
			its(:body) { is_expected.to match /tag/ }
			it 'should only update tag' do
				expect(Tag.count).to eq 1
				expect(Tag.first.title).to eq 'New tag title'
			end
    end
	end
	
	describe 'DELETE /tags/index' do

		let!(:tag) { FactoryBot.create(:tag) }

    before do
      headers = { 'Content-Type' => 'application/json' }
      delete "/api/v1/tags/#{tag.id}", headers: headers
    end

    subject { response }

    context 'invalid payload' do
      let(:title) { '' }
			its(:status) { is_expected.to eq 200 }
			
			it 'should not create user' do
				expect(Tag.count).to eq 0
			end
    end
  end
end