class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    FeedbacksMailer.feedback(params[:feedback], current_user).deliver_now
    flash[:success] = t('.success')
    redirect_to root_path
  end

  private

  def feedback
    params.permit(:feedback)
  end
end
