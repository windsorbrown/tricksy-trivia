class QuestionsController < ApplicationController
  before_action :load_question, only: :show
  
  def show
  end

  def load_question
    @question = Question.find(params[:id])
  end
end
