module ApplicationHelper
  def label_names
    labels = Desk::Labels.retrieve
    labels.map {|label| label.name }
  rescue => e
    flash[:error] = "Error retrieving label list"
    []
  end
end
