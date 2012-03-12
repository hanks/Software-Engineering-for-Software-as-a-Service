class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # set ratings enumerations
    @all_ratings = Movie.getRatings
    redirect_needed = false
    # get checkbox info
    # eg.{'G' => 1, 'R' => 1}
    @ratings = {}
    
    if params[:ratings] != nil
      @ratings = params[:ratings]
      session[:ratings] = @ratings
    else 
      if session[:ratings] != nil
        @ratings = session[:ratings]
        redirect_needed = true
      end
    end
    
    checkedBox = @all_ratings
    
    if not @ratings.empty?
      checkedBox = @ratings.keys
    end
    
    # sort condition
    if params[:condition] != nil
      condition = params[:condition]
      session[:condition] = condition 
    else
      if session[:condition] != nil
        condition = session[:condition]
        redirect_needed = true
      end
    end
    
    if condition == nil
      @movies = Movie.find(:all, :conditions => ["rating IN (?)", checkedBox])
    else
      @movies = Movie.find(:all, :conditions => ["rating IN (?)", checkedBox], :order => condition)
    end
    
    # change color of table when sorting is finished
    @high_light = condition
    # clear session
    #session.clear
    
    if redirect_needed
      redirect_to movies_path(:ratings => session[:ratings], :condition => session[:condition])
    end
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path(:ratings => session[:ratings], :condition => session[:condition])
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path(:ratings => session[:ratings], :condition => session[:condition])
  end

end
