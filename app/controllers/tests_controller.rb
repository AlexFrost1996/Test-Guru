class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    respond_to do |format|
      format.html { render plain: 'All tests' }
      format.json { render json: {tests: Test.all} }
    end
  end

  def new
    @test = Test.new
  end

  def show; end

  def create
    @test = Test.new(test_params)
    if @test.save
      render :show
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    render plain: 'Test was deleted!'
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found.'
  end
end
