class EventsController < ApplicationController
    before_action :authenticate_user!, except:[:index]

  def index

  end

  def new
    @event = Event.new

  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    puts "/"*45
    puts params
    puts "/"*45

    @event = Event.new(admin_id: current_user.id, title: params[:title], description: params[:description], start_date: params[:start_date], duration: params[:duration], price: params[:price], location: params[:location]) # avec xxx qui sont les données obtenues à partir du formulaire

    if @event.save
      #flash[:success] = "Evènement enregistré avec succès."
      redirect_to event_path(Event.last.id)
    else
      #flash.now[:error]
      render :new
    end
  end


end
