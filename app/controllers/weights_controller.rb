class WeightsController < ApplicationController
  before_filter :authorize
  before_filter :initialize, except: :create

  def index
    @weights = current_user.weights.paginate(page: params[:page])
  end

  def create
    @weight = current_user.weights.build(params[:weight])
    if @weight.save
      redirect_to @weight
    else
      render 'new'
  end

  def edit 
  end

  def update
    if @weighin.update(weight_params)
      redirect_to @weighin
    else
      render 'edit'
    end
  end

  def destroy
    @weight.destroy
    redirect_to 'index'
  end

  private

    def weight_params
      params.require(:weight).permit(:date)
    end

  protected

    def initialize
      @weight ||= current_user.weights.find_by_id(params[:id]) 
    end
   
end
