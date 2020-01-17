class Recipes_tags < ActiveRecord::Base
  belongs_to :programmer
  belongs_to :client
end
