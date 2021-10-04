class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound,  with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.order(created_at: :asc).pluck(:body)
    render plain: @questions * "\n"
    # render json: { questions: @test.questions }
  end

  def new
    @question = @test.questions.new 
  end

  def show
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_url(@test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_url(@question)
    else
      render :edit
    end
  end
  
  def destroy
    @question.destroy
    redirect_to admin_test_url(@question.test_id)
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
    head 404
  end
end
