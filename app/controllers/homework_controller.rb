class HomeworkController < ApplicationController
  before_action :require_authentication
  before_action :find_homework, :only => [:show, :update, :destroy]

  # GET /homework.json
  def index
    @homework = Homework.order(:name)
  end

  # GET /homework/1.json
  def show
  end

  # POST /homework.json
  def create
    @homework = Homework.new(homework_params)

    if @homework.save
      render :show, status: :created, location: @homework
    else
      render json: @homework.errors, status: :unprocessable_entity
    end
  end

  # PATCH /homework/1.json
  def update
    if @homework.update(homework_params)
      render :show, status: :ok, location: @homework
    else
      render json: @homework.errors, status: :unprocessable_entity
    end
  end

  # DELETE /homework/1.json
  def destroy
    @homework.destroy
    head :no_content
  end

  private

    def find_homework
      @homework = Homework.find(params[:id])
    end

    def homework_params
      params[:homework].permit(:name, :summary, :body)
    end
end