class Calculator
  include ActionView::Helpers::NumberHelper
  attr_accessor :start_age, :end_age, :money_goal
  
  def initialize(start_age, end_age, money_goal)
    @start_age = start_age.to_i.abs
    @end_age = end_age.to_i.abs
    @money_goal = money_goal.to_f.abs.round(2)
  end
  
  def perform
    hash = {
      year_saving: number_to_currency(year_saving),
      month_saving:number_to_currency(month_saving),
      day_saving: number_to_currency(day_saving),
      number_of_year: number_of_year,
      money_goal: number_to_currency(money_goal),
      start_age: start_age,
      end_age: end_age,
    }
  end
  
  private
  
  def number_of_year
    end_age - start_age
  end
  
  def year_saving
    (money_goal / number_of_year).to_f
  end
  
  def month_saving
    (year_saving / 12).to_f
  end
  
  def day_saving
    (year_saving / 365).to_f
  end 
end