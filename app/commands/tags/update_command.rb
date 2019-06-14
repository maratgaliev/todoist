class Tags::UpdateCommand < BaseCommand
  
  step :find
  step :validate
  step :update

	def find(id:, params:)
    tag = Tag.find_by(id: id)

    if tag
      Success(tag: tag, params: params)
    else
      Failure(error(I18n.t('errors.tags.not_found')))
    end    
  end

	def validate(tag:, params:)
    form = Tags::Form.call(params)

    if form.success?
      Success(tag: tag, params: form.to_h)
    else
      Failure(form.errors)
    end
  end

	def update(tag:, params:)
    tag.assign_attributes(params)

    if tag.save
      Success(tag)
    else
      Failure(error(I18n.t('errors.base')))
    end
  end
end
