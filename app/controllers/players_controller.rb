class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]

  # GET /players
  def index
    @players = Player.all

    render json: @players
  end

  # GET /players/1
  def show
    render json: PlayerSerializer.new(@player).to_serialized_json
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: PlayerSerializer.new(@player).to_serialized_json, status: :created, location: PlayerSerializer.new(@player).to_serialized_json
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: PlayerSerializer.new(@player).to_serialized_json
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.permit(:name, :kills, :alive)
    end
end
