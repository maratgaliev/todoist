class Tags::CreateCommand < BaseCommand
  step :validate
  step :persist
	def validate(params:)
    form = Tags::Form.call(params)

    if form.success?
      Success(params: form.to_h)
    else
      Failure(form.errors)
    end
  end

  def persist(params:)
    tag = Tag.new(params)
    if tag.save
      Success(tag)
    else
      Failure(error(I18n.t('errors.base')))
    end
  end
end
