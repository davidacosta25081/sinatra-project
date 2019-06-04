class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :pages_completed
      t.string :description
      t.string :user_id
    end
  end
end
