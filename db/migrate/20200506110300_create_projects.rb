class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.json :node_data
      t.boolean :draft, default: true
      t.string :slug
      t.references :user

      t.index :slug,                unique: true
      t.index :name
      t.timestamps
    end
  end
end
