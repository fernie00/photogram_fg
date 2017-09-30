class FriendRequestsSentsController < ApplicationController
  def index
    @friend_requests_sents = FriendRequestsSent.all

    render("friend_requests_sents/index.html.erb")
  end

  def show
    @friend_requests_sent = FriendRequestsSent.find(params[:id])

    render("friend_requests_sents/show.html.erb")
  end

  def new
    @friend_requests_sent = FriendRequestsSent.new

    render("friend_requests_sents/new.html.erb")
  end

  def create
    @friend_requests_sent = FriendRequestsSent.new

    @friend_requests_sent.sender_id = params[:sender_id]
    @friend_requests_sent.recipient_id = params[:recipient_id]

    save_status = @friend_requests_sent.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/friend_requests_sents/new", "/create_friend_requests_sent"
        redirect_to("/friend_requests_sents")
      else
        redirect_back(:fallback_location => "/", :notice => "Friend requests sent created successfully.")
      end
    else
      render("friend_requests_sents/new.html.erb")
    end
  end

  def edit
    @friend_requests_sent = FriendRequestsSent.find(params[:id])

    render("friend_requests_sents/edit.html.erb")
  end

  def update
    @friend_requests_sent = FriendRequestsSent.find(params[:id])

    @friend_requests_sent.sender_id = params[:sender_id]
    @friend_requests_sent.recipient_id = params[:recipient_id]

    save_status = @friend_requests_sent.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/friend_requests_sents/#{@friend_requests_sent.id}/edit", "/update_friend_requests_sent"
        redirect_to("/friend_requests_sents/#{@friend_requests_sent.id}", :notice => "Friend requests sent updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Friend requests sent updated successfully.")
      end
    else
      render("friend_requests_sents/edit.html.erb")
    end
  end

  def destroy
    @friend_requests_sent = FriendRequestsSent.find(params[:id])

    @friend_requests_sent.destroy

    if URI(request.referer).path == "/friend_requests_sents/#{@friend_requests_sent.id}"
      redirect_to("/", :notice => "Friend requests sent deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Friend requests sent deleted.")
    end
  end
end
