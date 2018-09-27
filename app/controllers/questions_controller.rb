class QuestionsController < ApplicationController
  before_action :load_question, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
    @question.answers.build
  end

  def index
    @questions = Question.all.paginate page: params[:page], per_page: 10
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t ".question_create"
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    if @question.update_attributes(question_params)
      flash[:success] = t ".update"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t ".question_destroy"
    else
      flash[:danger] = t ".can_not"
    end
    redirect_to questions_path
  end

  private

    def question_params
      params.require(:question).permit :content,
        answers_attributes: [:content, :correct]
    end

    def load_question
      @question = Question.find_by id: params[:id]
      return if @question
      flash[:danger] = t ".not_question"
      render :new
    end
end
