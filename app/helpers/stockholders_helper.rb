module StockholdersHelper

  def shares_issuable_pie_chart
    pie_chart @stockplans.group(:series).sum(:shares_issuable)
  end

  def shares_authorized_pie_chart
    pie_chart @stockplans.group(:series).sum(:shares_authorized)
  end

  def shares_issuable_column_chart
    column_chart @stockplans.group(:series).sum(:shares_issuable)
  end

  def shares_reserved_column_chart
    column_chart @stockplans.group(:series).sum(:shares_reserved)
  end

  def shares_authorized_column_chart
    column_chart  @stockplans.group(:series).sum(:shares_authorized)
  end

end