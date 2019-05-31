class CreatePuntutations < ActiveRecord::Migration[5.2]
  def change
    create_table :puntutations do |t|
      t.integer :puntutation
      t.string :comment
      t.references :user, foreign_key: true
      t.references :checkout, foreign_key: true

      t.timestamps
    end
  end
end
