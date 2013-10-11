class WeightsController < ApplicationController
  before_filter :authorize

  def index
    @weights = current_user.weights.paginate(page: params[:page])
  end

  def new
    @weight = current_user.weights.new
  end

  def create
    @weight = current_user.weights.build(weight_params)
    if @weight.save
      redirect_to weights_path
    else
      render 'new'
    end
  end

  def edit
    @weight = current_user.weights.find_by_id(params[:id]) 
  end

  def update
    @weight = current_user.weights.find_by_id(params[:id])
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
   
end
