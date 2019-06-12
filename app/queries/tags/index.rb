class Tags::Index
  include Dry::Transaction
  PER_PAGE = 10
  step :tasks_scope
  step :paginate

  def self.query(params={}, &block)
    new.call(params: params, &block)
  end

  def tasks_scope(params:)
    Success(tasks: Tag.all, params: params)
  end

  def paginate(tasks:, params:)
    Success(tasks.paginate(page: params[:page], per_page: PER_PAGE))
  end
end