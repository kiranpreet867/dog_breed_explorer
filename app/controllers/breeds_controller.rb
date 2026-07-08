class BreedsController < ApplicationController
  def index
    if params[:search].present?
      @breeds = Breed.where("name LIKE ?", "%#{params[:search]}%").order(:name)
    else
      @breeds = Breed.order(:name)
    end
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
