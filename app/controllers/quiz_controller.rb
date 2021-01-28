class QuizController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Quiz.all
  end

  def show
    render json: Quiz.find(params["id"])
  end

  def create
    render json: Quiz.create(params["quiz"])
  end

  def delete
    render json: Quiz.delete(params["id"])
  end

  def update
    render json: Quiz.update(params["id"], params["quiz"])
end

end
