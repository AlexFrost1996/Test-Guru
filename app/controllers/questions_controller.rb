class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound,  with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.order(created_at: :asc).pluck(:body)
    render plain: @questions * "\n"
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
    @question = @test.questions.new 
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render :show
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    render plain: 'Question was deleted!'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end
end
