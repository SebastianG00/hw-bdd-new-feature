class AddDirectorToMovies < ActiveRecord::Migration
  def change
    #The director field should be a string containing the name of the movie’s director.
    add_column :movies, :director, :string
  end
end
