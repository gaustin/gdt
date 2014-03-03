class LabelsController < ApplicationController
  def index
    @labels = Desk::Labels.retrieve
  rescue => e
    flash[:error] = "There was an error retrieving cases."
    log_exception(e)
    redirect_to root_url
  end

  def new
  end

  def create
    Desk::Label.create(params[:label])
    redirect_to labels_url
  rescue DeskApi::Error::UnprocessableEntity => e
    # TODO: DeskApi exceptions should be wrapped and error messages parsed out.
    log_exception(e)
    messages = e.errors.map {|key, values| "#{key} is #{values.join(", ")}"}
    message = "Error creating label: #{messages.join("; ")}"
    logger.error(message)
    flash[:error] = message
    redirect_to labels_url
  rescue => e
    log_exception(e)
    flash[:error] = "There was an unexpected error while creating the label"
    redirect_to root_url
  end
end
