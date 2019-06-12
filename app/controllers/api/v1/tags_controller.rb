class Api::V1::TagsController < Api::V1::BaseController

	def index
		Tags::Index.query(params) do |q|
			q.success {|tasks| api_response(tasks) }
			q.failure { api_response([]) }
		end
	end

	def create
		run_command(Tags::CreateCommand, params: task_params)
	end
	
	def update
		run_command(
			Tags::UpdateCommand,
			id: params[:id],
			params: task_params
		)
	end

	def destroy
		Tags::DestroyCommand.run(id: params[:id]) do |m|
			m.success { head :ok }
			m.failure {|errors| error_response(errors) }
		end
	end

	private
	
	def task_params
		ActiveModelSerializers::Deserialization.jsonapi_parse(params)
	end
end