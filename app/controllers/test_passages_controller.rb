class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist] 

  def show
    if @test_passage.current_question != nil
      render :show
    else
      redirect_to root_path, notice: t('.no_questions')
    end
  end

  def result
  end

  def update
    return redirect_to test_passage_path(@test_passage), notice: t('.no_answer') unless params[:answer_ids]
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      #TestsMailer.completed_test(@test_passage).deliver_now
      BadgeService.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call

    if new_gist.success?
      question_title = @test_passage.current_question.body
      current_user.gists.create(url: result.id, question_id: @test_passage.current_question.id)

      flash_options = { notice: t('.success') + " #{result.html_url}"}
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
