class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id, foreign_key: true
      t.integer :room_id, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
