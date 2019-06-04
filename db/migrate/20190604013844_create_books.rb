class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :description
      t.string :status
      t.string :user_id
    end
  end
end
