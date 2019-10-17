class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.string :body, null: false
      t.string :submitted_by, null: false

      t.timestamps
    end
  end
end
