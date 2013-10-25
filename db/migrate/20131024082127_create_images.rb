class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image
      t.references :imageble, :polymorphic => true
      t.string :title
    end
  end
end
