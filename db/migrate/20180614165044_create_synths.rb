class CreateSynths < ActiveRecord::Migration[5.2]
  def change
    create_table :synths do |t|
      t.string :name
      t.text :description
      t.string :body_format
      t.string :model_no
      t.string :processor
      t.string :memory
      t.string :battery_life
      t.string :build_date
      t.boolean :cleaning, default: false
      t.boolean :cooking, default: false
      t.boolean :childcare, default: false
      t.boolean :diy, default: false
      t.boolean :construction, default: false
      t.boolean :painting, default: false
      t.boolean :gardening, default: false
      t.boolean :healthcare, default: false
      t.boolean :elderlycare, default: false
      t.boolean :animalcare, default: false
      t.boolean :driving, default: false
      t.boolean :self_defense, default: false
      t.boolean :security, default: false
      t.boolean :entertainment, default: false

      t.timestamps
    end
  end
end
