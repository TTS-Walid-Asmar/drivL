class LikesController < ApplicationController
  def create
    @drivet = Drivet.find(params[:drivet_id])
    @drivet.likes.where(user_id: current_user.id).first_or_create
    redirect_to request.referrer, notice: "You like this drivL?!"
  end
  def destroy
    @drivet = Drivet.find(params[:drivet_id])
    @drivet.likes.find_by(user_id: current_user.id).destroy
    redirect_to request.referrer
  end
end
