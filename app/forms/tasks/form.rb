Tasks::Form = Dry::Validation.Params do
	required(:title).filled(:str?)
	optional(:tags).maybe(type?: Array)
end