class PollsController < ApplicationController

  before_action :correct_user,       only: [:destroy,:edit]
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
    @poll.vote_options.build
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

  def show
    @poll = Poll.includes(:vote_options).find_by_id(params[:id])
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
    @poll=current_user.polls.find_by(id: params[:id])
    if @poll.nil?
      flash[:alert] = "Not your poll!"
      redirect_back fallback_location: root_path
    end
  end

  def poll_params
    params.require(:poll).permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
  end
end
