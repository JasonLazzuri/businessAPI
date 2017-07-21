class ApplicationController < ActionController::API
  include Response

  WillPaginate.per_page = 10


  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

end
