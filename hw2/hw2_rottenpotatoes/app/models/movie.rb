class Movie < ActiveRecord::Base
  #static method to get rating enumeration
  def self.getRatings
    ['G', 'PG', 'PG-13', 'R']
  end
  
  # return movies by array of checkbox info
  def self.getMoviesByCheckBoxInfo checked
      where(:rating => checked)
  end
end
