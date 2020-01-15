class AddJoinTable < ActiveRecord::Migration[5.2]
  def change
    
    create_table :tags_recipes, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :tag, index:true
    end

  end
end
