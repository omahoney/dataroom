module OptionplansHelper

  def options_issuable_pie_chart
    pie_chart @optionplans.group(:plan_title).sum(:shares_allocated)
  end

  def options_authorized_pie_chart
    pie_chart @optionplans.group(:plan_title).sum(:shares_allocated)
  end

  def options_issuable_column_chart
    column_chart @optionplans.group(:plan_title).sum(:shares_allocated)
  end

  def options_reserved_column_chart
    column_chart @optionplans.group(:plan_title).sum(:shares_allocated)
  end

  def options_authorized_column_chart
    column_chart  @optionplans.group(:plan_title).sum(:shares_allocated)
  end

end
