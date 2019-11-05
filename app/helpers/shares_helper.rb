module SharesHelper

  # shares/dashboard
  def shares_outstanding_by_series
    result = {}
    @stockplans.map do |c|
      result[c.series] = c.shares.where(active: true).sum(:shares_issued)
    end
    return result
  end

  def shares_ownership
    @shares_active.includes(:person).group(:'name').sum(:shares_issued)
  end

  # shares/captable
  def shares_dilutive
    @convertiblenotes.sum(:share_cap) + @optionplans.sum(:shares_allocated) - @options.sum(:exercised)
  end
  def shares_diluted
    @shares.where(active: true).sum(:shares_issued) + shares_dilutive
  end

  def shares_fullydiluted
    result = {}
    @stockplans.map do |c|
      result[c.series] = c.shares.where(active: true).sum(:shares_issued) + c.optionplans.sum(:shares_allocated)
    end
    return result
  end

  # shares/newround
  def shares_newround_fullydiluted
    result = {}
    @stockplans.map do |c|
      result[c.series] = c.shares.where(active: true).sum(:shares_issued) + c.optionplans.sum(:shares_allocated) + @roundshares.to_i
    end
    return result
  end




  def column_fullydiluted
    outstanding = {}
    dilutive = {}
    notes = {}

    @stockplans.map do |c|
      outstanding[c.series] = c.shares.where(canceled: false).sum(:shares_issued)
      dilutive[c.series] = c.option_plans.sum(:sharesallocated)
      #optionshares = @optionplans.where(stock_plan_id: c.id)
      #optionshares.map do |o|
      #  dilutive[c.series] = o.options.sum(:granted) - o.options.sum(:exercised) - o.options.sum(:forfeited)
      #if optionshares = @optionplans.find_by(stock_plan_id: c.id)
      #  dilutive[c.series] = @options.where(option_plan_id: optionshares.id).sum(:granted) - @options.where(option_plan_id: optionshares.id).sum(:exercised) - @options.where(option_plan_id: optionshares.id).sum(:forfeited)
      #else
      #  dilutive[c.series] = '0'
      #end
      if noteshares = @convertible_notes.where(stock_plan_id: c.id)
        notes[c.series] = noteshares.sum(:cap_shares)
      else
        notes[c.series] = '0'
      end
    end

    column_chart [
                     {name: "Outstanding", data:
                         outstanding
                     },
                     {name: "Options", data:
                         dilutive
                     },
                     {name: "Notes", data:
                         notes
                     }
                 ],
                 stacked: true
  end


end

