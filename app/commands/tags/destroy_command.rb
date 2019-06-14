class Tags::DestroyCommand < BaseCommand
  step :find
  step :destroy

  def find(id:)
    tag = Tag.find_by(id: id)

    if tag
      Success(tag)
    else
      Failure(error(I18n.t('errors.tags.not_found')))
    end
  end

  def destroy(tag)
    tag.delete
    Success(:deleted)
  end
end
