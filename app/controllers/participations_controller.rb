class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:edit, :update, :destroy]

  def new
    @participation = Participation.new
  end

  def create
    @project = Project.find(params[:project_id])
    @participation = Participation.new(participation_params)
    @participation.project = @project
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
      params.require(:participation).permit(participation_pictures: [])
    end

    # def login
    #   if current_user == fimd dqtq
    #     # return :authenticate_user!
    #     return
    #   else
    #     new_user_registration_path
    #   end
    # end

end
