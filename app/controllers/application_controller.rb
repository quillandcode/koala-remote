class ApplicationController < ActionController::API
  def method_not_allowed
    render json: { error: "That method is not allowed on this endpoint." }, status: :method_not_allowed
  end
end
