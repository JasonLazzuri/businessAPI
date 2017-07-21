class ApplicationController < ActionController::API
  include Response

  use Rack::Throttle::Minute,   :max => 2

  rescue_from ActiveRecord::RecordNotFound do |exception|
  json_response({ message: exception.message }, :not_found)
end

end
