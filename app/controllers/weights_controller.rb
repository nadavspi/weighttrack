class WeightsController < ApplicationController
  before_filter :authorize

  def index
    @weights = current_user.weights.paginate(page: params[:page], per_page: 15)
    @weight = current_user.weights.new
  end

  def show
    @weight = current_user.weights.find_by_id(params[:id])
  end

  def new
    @weight = current_user.weights.new
  end

  def create
    @weight = current_user.weights.new(weight_params)
    if @weight.save
      respond_to do |format|
        format.html { redirect_to weights_path }
        format.js 
      end
    else 
      render 'index'
    end
  end

  def edit
    @weight = current_user.weights.find_by_id(params[:id]) 
  end

  def update
    @weight = current_user.weights.find_by_id(params[:id])
    respond_to do |format|
      if @weight.update(weight_params)
        format.html { redirect_to @weight }
        format.json { respond_with_bip @weight }
      else
        format.html { render 'edit' }
        format.json { respond_with_bip @weight }
      end
    end
  end

  def destroy
    @weight = current_user.weights.find_by_id(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to weights_path }
      format.js
    end
  end

  private

    def weight_params
      params.require(:weight).permit(:value, :date)
    end
   
end
