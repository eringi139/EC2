class Public::OrdersController < ApplicationController
  before_action :authenticate_member!, only: [:new, :confirm, :thanx, :create :index, :show]
  
  def new
  end

  def confirm
    
  end

  def thanx
  end

  def create
  end

  def index
  end

  def show
  end
end
