class LabelsController < ApplicationController
  def index
    @labels = Desk::Labels.retrieve
  rescue => e
    flash[:error] = "There was an error retrieving cases."
    log_exception(e)
    redirect_to root_url
  end
end
