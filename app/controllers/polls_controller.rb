class PollsController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy]

  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
    @poll.vote_options.build
  end

  def show
  @poll = Poll.includes(:vote_options).find_by_id(params[:id])
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      flash[:success] = 'Poll was created!'
      redirect_to polls_path
    else
      redirect_to new_poll_path
    end
  end

  def edit
    @poll = Poll.find_by_id(params[:id])
  end

  def update
    @poll = Poll.find_by_id(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to polls_path
    else
      render 'edit'
    end
  end

  def destroy
    @poll = Poll.find_by_id(params[:id])
    if @poll.destroy
      flash[:success] = 'Poll was destroyed!'
    else
      flash[:warning] = 'Error destroying poll...'
    end
    redirect_to polls_path
  end

  def show
    @poll = Poll.find_by_id(params[:id])
  end

  private

  def correct_user
    # .to_i converts values to integers here because params[:id] is a string
    # Without this current_user.id and params[:id] would never match
    if current_user.id != params[:id].to_i
      redirect_to polls_path
    end
  end

  def poll_params
    params.require(:poll).permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
  end
end
