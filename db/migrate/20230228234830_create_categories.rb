class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :author, null: false, foreign_key:  {to_table: :users}
      t.string :name
      t.decimal :icon, defualt: 'https://cdn-icons-png.flaticon.com/512/696/696755.png'

      t.timestamps
    end
  end
end
