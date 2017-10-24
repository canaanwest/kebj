class LovesController < ApplicationController
  before_action :find_love, except: [:index, :new, :create]

  def index
    @loves = Love.all
  end

  def show
  end

  def new
    @love = Love.new
  end

  def create
    @love = Love.new love_params
    if @love.save
      redirect_to loves_path
    end 
  end

private
  def find_love
    @love = Love.find(params[:id])
  end

  def love_params
    params.require(:love).permit(:love, :description)
  end
end
