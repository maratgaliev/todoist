
require 'active_model_serializers/register_jsonapi_renderer'

ActiveModelSerializers.config.tap do |config|
	config.adapter = :json_api
	config.key_transform = :underscore
end

api_mime_types = %W(
  application/vnd.api+json
  text/x-json
  application/json
)
Mime::Type.register 'application/vnd.api+json', :json, api_mime_types