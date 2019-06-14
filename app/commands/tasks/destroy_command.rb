class Tasks::DestroyCommand < BaseCommand
  step :find
  step :destroy

  def find(id:)
    task = Task.find_by(id: id)

    if task
      Success(task)
    else
      Failure(error(I18n.t('errors.tasks.not_found')))
    end
  end

  def destroy(task)
    task.delete
    Success(:deleted)
  end
end
