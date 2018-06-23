class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :action
      t.references :repository, foreign_key: true
      t.references :sender, foreign_key: { to_table: :users }
      t.references :issue, foreign_key: true

      t.timestamps
    end
  end
end
