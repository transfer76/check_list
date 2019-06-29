class FormQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form
  before_action :set_form_question, only: [:edit, :destroy]

  after_action :verify_authorized
  after_action :verify_policy_scoped

  def new
    authorize @form_question

    @form_question = @form.form_questions.new
  end

  def edit
    authorize @form_question
  end

  def create
    authorize @form_question

    @form_question = @form.form_questions.new(form_question_params)

    if @form_question.save
      redirect_to @form, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @form_question

    if @form.form_questions.update(form_question_params)
      redirect_to @form, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @form_question

    @form_question.destroy!
    redirect_to form_url(@form), notice: 'Question was successfully destroyed.'
  end

  private

  def set_form
    @form = current_user.forms.find(params[:form_id])
  end

  def set_form_question
    @form_question = @form.form_questions.find(params[:id])
  end

  def form_question_params
    params.require(:form_question).permit(:title, :description)
  end
end
