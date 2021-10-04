class QuestionsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :find_question, only: :show

  rescue_from ActiveRecord::RecordNotFound,  with: :rescue_with_question_not_found

  def show
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
    head 404
  end
end
