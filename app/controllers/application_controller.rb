class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_exception(e)
    logger.error(e.message)
    logger.error(e.backtrace.join("\n"))
  end
end
