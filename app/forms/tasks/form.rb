Tasks::Form = Dry::Validation.Params do
  required(:title).filled(:str?)
end