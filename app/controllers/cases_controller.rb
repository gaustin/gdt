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
  end

  private
  attr_reader :filters
  def filters
    @filters = Desk::Filters.retrieve
  end
end
