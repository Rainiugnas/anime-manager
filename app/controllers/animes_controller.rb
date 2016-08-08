## Animes controller
# Handle pages link to anime
##
class AnimesController < ApplicationController

  ## Render stats (homepage)
  # Access:
  #   Route: GET /
  #   Helper: root_path
  #   Format: Html
  ##
  def stats
  end

  ## Render animes to check
  # Access:
  #   Route: GET /animes/to_check
  #   Helper: to_check_animes_path
  #   Format: Html
  ##
  def to_check
    @animes = Anime.all
  end

  ## Render animes to see
  # Access:
  #   Route: GET /animes/to_see
  #   Helper: to_see_animes_path
  #   Format: Html
  ##
  def to_see
  end

  ## Render anime to saw
  # Access:
  #   Route: GET /anime/saw
  #   Helper: to_saw_animes_path
  #   Format: Html
  ##
  def saw
  end

  ## Render new
  # Access:
  #   Route: GET /animes/new
  #   Helper: new_anime_path
  #   Format: Html
  ##
  def new
    @anime = Anime.new
  end

  ## Handle create form
  # Access:
  #   Route: POST /animes
  #   Helper: anime_path
  #   Format: Html
  # Params:
  #   anime: String - Key:
  #     title: String(required) - Title of anime
  #     description: String - Description of anime
  #     adala: String - Link for anime in adala new
  #     t411: String - Link for anime in t411
  #     trailer: String - Link to anime trailer
  #     step: String(required, value: To check, To see, Saw) - Step of anime
  #     state: String(required, value: Waiting, To dl) - State of anime
  #     season: String(default: 1) - Season of anime
  #     rate: Integer(default: 1) - Rate of anime
  #     release: Date(required) - Release date of anime
  #     estimate: Date(default: release + 1 years) - When is ready to donwload
  # Notice:
  #   Success: Create anime and redirect to GET /
  #   Fail: render GET /anime/new
  ##
  def create
    @anime = Anime.new anime_params

    if @anime.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def anime_params
      params.require(:anime)
        .permit :title, :description, :adala, :t411, :trailer, :step, :state,
                :season, :rate, :release, :estimate
    end
end
