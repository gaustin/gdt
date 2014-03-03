class CasesController < ApplicationController
  def index
    @cases = if filters.present? && (filter = filters.first)
               filter.cases
             else
               []
             end
  rescue => e
    flash[:error] = "There was an error retrieving cases."
    log_exception(e)
    redirect_to root_url
  end

  def update
    # TODO: Too much logic here. Move to collaborator.
    _case = find_case(params["id"])
    if params["append"]
      _case.append_label(params["label"])
    elsif params["clear"]
      _case.clear_labels
    end
  rescue => e
    flash[:error] = "There was an error updating the case."
    log_exception(e)
  ensure
    redirect_to cases_url
  end

  private
  attr_reader :filters
  def filters
    @filters = Desk::Filters.retrieve
  end

  def find_case(id)
    Desk::Case.find(id)
  end
end
