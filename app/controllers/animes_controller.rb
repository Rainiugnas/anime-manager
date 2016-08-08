## Animes controller
# Handle pages link to anime
##
class AnimesController < ApplicationController
  before_action :set_anime, only: [:edit, :update, :destroy, :next_step]

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
    @releases = Release.all
  end

  ## Render animes to see
  # Access:
  #   Route: GET /animes/to_see
  #   Helper: to_see_animes_path
  #   Format: Html
  ##
  def to_see
    @animes = Anime.to_see.order rate: :desc, state: :asc, estimate: :asc, title: :desc
  end

  ## Render anime to saw
  # Access:
  #   Route: GET /anime/saw
  #   Helper: to_saw_animes_path
  #   Format: Html
  ##
  def saw
    @animes = Anime.saw.order rate: :desc, title: :desc
  end

  ## Set anime step to next
  # Access:
  #   Route: PATCH /anime/:id/next_step
  #   Helper: next_step_animes_path
  #   Format: Html
  # Params:
  #   id: Integer - Id of anime
  # Notice:
  #   Redirect to current page
  ##
  def next_step
    @anime.next_step!
    redirect_to :back
  end

  ## Render new form
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
  #     release_id: Integer(required) - Id of parent release
  #     estimate: Date(default: release + 1 years) - When is ready to donwload
  # Notice:
  #   Success: Create anime and redirect to GET /
  #   Fail: render GET /anime/new
  ##
  def create
    @anime = Anime.new anime_params

    if @anime.save
      then redirect_to root_path else render 'new' end
  end

  ## Render edit form
  # Access:
  #   Route: GET /animes/:id/edit
  #   Helper: edit_anime_path
  #   Format: Html
  # Params:
  #   id: Integer - Id of anime
  ##
  def edit
  end

  ## Handle edit form
  # Access:
  #   Route: PATCH /animes/:id/
  #   Helper: edit_anime_path
  #   Format: Html
  # Params:
  #   id: Integer - Id of anime
  # Notice:
  #   See create for other params
  #   Success: update anime and redirect to GET /
  #   Fail: render GET /anime/:id/edit
  ##
  def update
    if @anime.update anime_params
      then redirect_to root_path else render 'edit' end
  end

  ## Delete anime
  # Access:
  #   Route: DELETE /animes/:id/
  #   Helper: anime_path
  #   Format: Html
  # Params:
  #   id: Integer - Id of anime
  # Notice:
  #   Redirect to previous page
  ##
  def destroy
    @anime.delete
    redirect_to :back
  end

  private
    ## Filter params for anime
    # Params:
    #   See create or update
    # Return:
    #   Hash - without key and bad params
    ##
    def anime_params
      params.require(:anime)
        .permit :title, :description, :adala, :t411, :trailer, :step, :state,
                :season, :rate, :release_id, :estimate
    end

    ## Set @anime in function of the id inside the url
    # Params:
    #   id: Integer - Id of anime
    ##
    def set_anime
      @anime = Anime.find params[:id]
    end
end
