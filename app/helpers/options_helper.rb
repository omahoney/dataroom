module OptionsHelper

  def options_outstanding
    @options_active.includes(:person).group(:'name').sum(:granted)
  end

  def options_status
    result = { "Total" => @optionplans.sum(:shares_allocated), "Granted" => @options.sum(:granted), "Outstanding" => (@options.sum(:granted) - @options.sum(:exercised) - @options.sum(:forfeited)), "Exercised" => @options.sum(:exercised), "Forfeited" => @options.sum(:forfeited), "Remaining" => (@optionplans.sum(:shares_allocated) - @options.sum(:granted) + @options.sum(:forfeited)) }
  end



  # options/dashboard

  def column_total_options_issued_by_person
    column_chart @options_active.includes(:person).group(:'name').sum(:granted)
  end

  def bar_total_options_outstanding_by_person
    bar_chart @options_active.includes(:person).group(:'name').sum(:granted), height: "800px"
  end

  def column_options_by_status # result = {}
    #  @optionplans do |c|
    #  result[c.plantitle] = c.options
    #end

    column_chart({ "Total" => @optionplans.sum(:sharesallocated), "Granted" => @optionplans.options.sum(:granted), "Outstanding" => @optionplans.options.sum(:granted), "Exercised" => @optionplans.options.sum(:exercised), "Remaining" => @optionplans.sharesallocated - @optionplans.options.sum(:granted) })
  end

  def pie_options_by_person
    pie_chart @options_active.includes(:person).group(:'name').sum(:granted)
  end
end