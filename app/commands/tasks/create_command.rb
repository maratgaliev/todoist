class Tasks::CreateCommand < BaseCommand
  step :validate
  step :persist
	def validate(params:)
    form = Tasks::Form.call(params)

    if form.success?
      Success(params: form.to_h)
    else
      Failure(form.errors)
    end
  end

  def persist(params:)
    task = Task.new(params)
    if task.save
      Success(task)
    else
      Failure(error(I18n.t('errors.base')))
    end
  end
end