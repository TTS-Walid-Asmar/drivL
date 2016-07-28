class DrivetsController < ApplicationController
  before_action :set_drivet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @drivet = Drivet.new
  end
  def show
  end
  def index
    @drivets = Drivet.all
  end

  def create
  @drivet = Drivet.new(drivet_params)
   if @drivet.save
      redirect_to @drivet, notice: "drvL propagated"
    else
      render :new
    end
  end
  def update
    if @drivet.update(drivet_params)
       redirect_to @drivet, notice: "drvL ammended"
     else
       render :edit
     end
  end
  def destroy
    @drivet.destroy
    redirect_to drivets_path
  end
 private

def set_drivet
  @drivet = Drivet.find(params[:id])
end

 def drivet_params
   params.require(:drivet).permit(:message, :user_id)
 end


end
