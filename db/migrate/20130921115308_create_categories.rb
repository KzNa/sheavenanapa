class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string  :title
      t.text    :name 
    	t.text    :description
    	t.integer :position
    	t.integer :parent_id
      t.boolean :haschild
        t.timestamps
    end
  end
end
