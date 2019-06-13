describe Api::V1::TasksController, type: :request do
	
	describe 'GET /tasks/index' do
		let!(:task) { FactoryBot.create(:task) }
		let!(:task_two) { FactoryBot.create(:task) }

    before do
      headers = { 'Content-Type' => 'application/json' }
      get '/api/v1/tasks', headers: headers
    end

    subject { response }

    context 'index' do
			its(:status) { is_expected.to eq 200 }
			its(:body) { is_expected.to match /task/ }
			
			it 'should not create user' do
				expect(Task.count).to eq 2
			end
		end
		
	end
	
	describe 'POST /tasks' do
    let(:title) { 'My task' }

    before do
      headers = { 'Content-Type' => 'application/json' }
			params = {"data": { "attributes": {"title": title}} }
      post '/api/v1/tasks', headers: headers, params: params.to_json
    end

    subject { response }

    context 'invalid payload' do
      let(:title) { '' }

      its(:status) { is_expected.to eq 422 }
      its(:body) { is_expected.to eq '{"errors":{"title":["must be filled"]}}' }
    end

    context 'valid credentials' do
      its(:status) { is_expected.to eq 200 }
			its(:body) { is_expected.to match /task/ }
			
			it 'should create task' do
				expect(Task.count).to eq 1
			end
    end
	end
	
	describe 'PATCH /tasks' do
		let(:title) { 'New task title' }
		let!(:task) { FactoryBot.create(:task) }

    before do
      headers = { 'Content-Type' => 'application/json' }
			params = {"data": { "attributes": {"title": title}} }
      patch "/api/v1/tasks/#{task.id}", headers: headers, params: params.to_json
    end

    subject { response }

    context 'invalid payload' do
      let(:title) { '' }
      its(:status) { is_expected.to eq 422 }
			its(:body) { is_expected.to eq '{"errors":{"title":["must be filled"]}}' }
    end

    context 'valid credentials' do
      its(:status) { is_expected.to eq 200 }
			its(:body) { is_expected.to match /task/ }
			it 'should only update task' do
				expect(Task.count).to eq 1
				expect(Task.first.title).to eq 'New task title'
			end
    end
	end
	
	describe 'DELETE /tasks/index' do

		let!(:task) { FactoryBot.create(:task) }

    before do
      headers = { 'Content-Type' => 'application/json' }
      delete "/api/v1/tasks/#{task.id}", headers: headers
    end

    subject { response }

    context 'invalid payload' do
      let(:title) { '' }
			its(:status) { is_expected.to eq 200 }
			
			it 'should not create user' do
				expect(Task.count).to eq 0
			end
    end
  end
end