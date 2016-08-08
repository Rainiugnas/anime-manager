# Add method to class Date
class Date

  ## Get quarter name and year
  # Find quarter name and add year at the end
  # Return:
  #   String - "quarter year"
  ##
  def to_quarter
    quarter = %w(winter spring summer fall)[beginning_of_quarter.month % 4 - 1].capitalize

    "#{quarter} #{year.to_s}"
  end
end
