module StockplansHelper

  def stockplansIssuable
    @stockplans.group(:series).sum(:shares_issuable)
  end

  def stockplansAuthorized
    @stockplans.group(:series).sum(:shares_authorized)
  end

  def stockplansReserved
    @stockplans.group(:series).sum(:shares_reserved)
  end



end
