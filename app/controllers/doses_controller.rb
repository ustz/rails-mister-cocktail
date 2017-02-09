class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    ingredient = Ingredient.find(params[:dose][:ingredient])
    dose = Dose.create(description: params[:dose][:description], ingredient: ingredient, cocktail: @cocktail)
    @cocktail.doses << dose
    @cocktail.save
    ingredient.doses << dose
    ingredient.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
