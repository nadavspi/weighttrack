class WeightsController < ApplicationController
  before_filter :authorize

  def index
    @weights = current_user.weights.paginate(page: params[:page])
  end

  def new
    @weight = current_user.weights.new
  end

  def create
    @weight = current_user.weights.create(weight_params)
    redirect_to weights_path
  end

  def edit
    @weight = current_user.weights.find_by_id(params[:id]) 
  end

  def update
    @weight = current_user.weights.find_by_id(params[:id])
    if @weight.update(weight_params)
      redirect_to @weight
    else
      render 'edit'
    end
  end

  def destroy
    current_user.weights.find_by_id(params[:id]).destroy
    redirect_to 'index'
  end

  private

    def weight_params
      params.require(:weight).permit(:date, :value)
    end
   
end
