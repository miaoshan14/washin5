class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  def index
    if !params[:q].blank?
      @participations = participation.where("lower(name) like ?", "%#{params[:q].downcase}%" )
    else
      @participations = participation.all
    end
  end


  def new
    @participation = Participation.new
  end

  def create
    @participation = participation.new(participation_params)
    @participation.artist = current_user.artist
    respond_to do |format|
      if @participation.save
        format.html { redirect_to @participation, notice: 'Participation enregistrée' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @participation.update(participation_params)
        format.html { redirect_to @participation, notice: 'Participation mise à jour !' }
        format.json { render :show, status: :ok, location: @participation }
    else
      format.html { render :edit }
      format.json { render json: @participation.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to participations_url, notice: 'Participation retirée.' }
      format.json { head :no_content }
    end
  end

  private

    def set_participation
      @participation = Participation.find(params[:id])
    end

    def participation_params
      params.require(:participation).permit(:participation_picture)
    end

end
