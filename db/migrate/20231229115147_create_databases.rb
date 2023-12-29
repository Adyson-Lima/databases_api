class CreateDatabases < ActiveRecord::Migration[7.0]
  def change
    create_table :databases do |t|
      t.string :name
      t.string :community

      t.timestamps
    end
  end
end
