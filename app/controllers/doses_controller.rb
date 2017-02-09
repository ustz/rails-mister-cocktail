class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    # raise
    params[:dose][:ingredient] == "" ? ingredient = nil : ingredient = Ingredient.find(params[:dose][:ingredient])
    dose = Dose.new(description: params[:dose][:description], ingredient: ingredient, cocktail: @cocktail)
    if dose.save
    @cocktail.doses << dose
    @cocktail.save
    ingredient.doses << dose
    ingredient.save
    redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end

  # def create
  #   raise
  #   ingredient = Ingredient.find(params[:dose][:ingredient])
  #   dose = Dose.new(description: params[:dose][:description], ingredient: ingredient, cocktail: @cocktail)
  #   if dose.save
  #   @cocktail.doses << dose
  #   @cocktail.save
  #   ingredient.doses << dose
  #   ingredient.save
  #   redirect_to cocktail_path(@cocktail)
  #   else
  #     render :new
  #   end
  # end
