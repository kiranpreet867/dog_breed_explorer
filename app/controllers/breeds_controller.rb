class BreedsController < ApplicationController
  def index
    if params[:search].present?
      @breeds = Breed.where("name LIKE ?", "%#{params[:search]}%")
                     .order(:name)
                     .page(params[:page])
                     .per(10)
    else
      @breeds = Breed.order(:name)
                     .page(params[:page])
                     .per(10)
    end
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
