class ExpensesController < ApplicationController
  def index
    @expenses = @category.expenses.order(created_at: :desc)
  end

  def edit
    
  end

  def new
  end
end
