# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    #ERROR Code: Can't find mapping from "the details page for "Alien"" to a path
    when /^the details page for "(.*)"$/
        movie_path(Movie.find_by(title: $1))

    when /^the (RottenPotatoes )?home\s?page$/ then '/movies'

    # Add more mappings here.
    #The (.*) it looks for any text inside "" and Captures it
    #Hint: mapping between the human-readable name of the page (e.g. the edit page for "Alien")
    when /^the edit page for "(.*)"$/
        #Thte captured text is stored in a variable defined as $1
        edit_movie_path(Movie.find_by(title: $1))
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    
    #ERROR CODE: Then I should be on the Similar Movies page for "Star Wars" 
    when /^the Similar Movies page for "(.*)"$/
        same_movie_path(Movie.find_by(title: $1))
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = ::Regexp.last_match(1).split(/\s+/)
        send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" \
              "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
