class Tasks::Index
	include Dry::Transaction
	
	PER_PAGE = 10
	
  step :tasks_scope
  step :paginate

  def self.query(params={}, &block)
    new.call(params: params, &block)
  end

  def tasks_scope(params:)
    Success(tasks: Task.includes(:tags), params: params)
  end

  def paginate(tasks:, params:)
    Success(tasks.ordered.paginate(page: params[:page], per_page: PER_PAGE))
  end
end