class CalculatorForm
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks
  include Virtus.model

  # Attributes (DSL provided by Virtus)
  attribute :start_age, Integer
  attribute :end_age, Integer
  attribute :money_goal, Integer
  attribute :savings_rate, Integer

  # Access the expense record after it's saved
  attr_reader :start_age, :end_age, :money_goal, :savings_rate, :results

  # Validations
  validates :start_age, :end_age, :money_goal, presence: true
  validates :start_age, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
  validates :start_age, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  
  validates :end_age, numericality: { only_integer: true }
  validates :end_age, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validate  :end_age_is_superior_than_start_age?
  
  validates :money_goal, numericality: { only_integer: true, greater_than: 0 }
  validates :money_goal, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  
  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private
  
  def end_age_is_superior_than_start_age?
    if end_age.is_a?(Integer) && start_age.is_a?(Integer)
      if end_age > start_age
        true
      else
        errors.add(:start_age, "Start age must be superior than end age")
      end
    else
      errors.add(:start_age, "Integer only. No sign allowed.")
    end
  end
  
  def persist!
    @results = Calculator.new(start_age, end_age, money_goal).perform
  end
end