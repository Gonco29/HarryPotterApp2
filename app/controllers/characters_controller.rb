class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]

  def index
    @characters = Character.all
  end

  def show
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.save
    redirect_to character_path(@character)
  end

  def edit
  end

  def update
    @character.update(character_params)
    redirect_to character_path(@character)
  end

  def destroy
    @character.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to characters_path, status: :see_other
  end

  private

  def character_params
    params.require(:character).permit(:name, :actor, :review, :image_url)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
