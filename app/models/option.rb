class Option < ApplicationRecord
  belongs_to :company
  belongs_to :person
  belongs_to :optionplan
  belongs_to :valuation
  belongs_to :resolution


  has_one_attached :option_document

  validates :title, :uniqueness => { scope: :company_id,
                                     message: "should happen once per company" }

  scope :active, -> { where('active = ?', TRUE) }


  def outstanding
    if granted > 0
      outstanding = granted - exercised - forfeited
    end
  end

  def totalgrants
    @company = Company.find(params[:company_id])
    @options = @company.options.all
    @option_totalgrants = @options.count
  end

  def vestedMonths
    months = ((DateTime.now.year * 12 - DateTime.now.month) - (grant_date.year * 12 + grant_date.month))
    if months > vesting_term
      vestedMonths = vesting_term
    elsif cliff > months
      vestedMonths = 0
    else
      vestedMonths = months
    end
  end

  def vested
    if vestedMonths == 0
      vested = 0
    elsif vestedMonths == vesting_term
      vested = granted
    else
      vested = (granted / vesting_term) * vestedMonths
    end
  end
end

