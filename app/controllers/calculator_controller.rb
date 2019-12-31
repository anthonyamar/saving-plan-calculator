class CalculatorController < ApplicationController
  def show
    @data = session[:data] if session[:data]
  end

  def new
    @calculator = CalculatorForm.new
  end
  
  def create
    @calculator = CalculatorForm.new(calculator_params)
    if @calculator.save
      reset_session
      session[:data] = @calculator.results
      redirect_to calculator_show_path
    else
      redirect_to root_path
      @calculator.errors.each do |attr, msg|
        flash[:danger] = msg
      end
    end
  end

  private

  def calculator_params
    params.require(:calculator).permit(:start_age, :end_age, :money_goal, :savings_rate)
  end
end
