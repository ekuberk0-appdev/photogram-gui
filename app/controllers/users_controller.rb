class UsersController < ApplicationController

  def index

  matching_users = User.all

  @list_of_users = matching_users.order({ :username => :asc })

  render({ :template => "user_templates/index.html.erb" })
end 

def show
url_username = params.fetch("path_username")
matching_usernames = User.where({ :username => url_username })
@the_user = matching_usernames.at(0)

#if the_user == nil
  #redirect_to("/")
#else 
  #render({ :template => "user_templates/show.html.erb" })
#end 

  render({ :template => "user_templates/show.html.erb" })
end 

def create
insert_user_record = params.fetch("input_username")

a_new_user = User.new
a_new_user.username = insert_user_record
a_new_user.save

redirect_to("/users/" + a_new_user.username.to_s)
  #render({ :template => "user_templates/create.html.erb"})
end 

def update 

update_user = params.fetch("input_username")
the_updated_user = User.new
the_updated_user.username = update_user
the_updated_user.save

redirect_to("/users/" + the_updated_user.username.to_s)
  #render({ :template => "user_templates/update.html.erb"})
end 

end 