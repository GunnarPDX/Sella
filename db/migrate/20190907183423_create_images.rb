class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :handle
      t.string :url

      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
