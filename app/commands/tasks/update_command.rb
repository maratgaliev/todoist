class Tasks::UpdateCommand < BaseCommand
  
  step :find
  step :validate
  step :update

	def find(id:, params:)
    task = Task.find_by(id: id)

    if task
      Success(task: task, params: params)
    else
      Failure(error(I18n.t('errors.tasks.not_found')))
    end    
  end

	def validate(task:, params:)
    form = Tasks::Form.call(params)

    if form.success?
      Success(task: task, params: form.to_h)
    else
      Failure(form.errors)
    end
  end

	def update(task:, params:)
    task.assign_attributes(params)

    if task.save
      Success(task)
    else
      Failure(error(I18n.t('errors.base')))
    end
  end
end