class CreateCampanhas < ActiveRecord::Migration
  def change
    create_table :campanhas do |t|
      t.string :tipo
      t.string :nome

      t.timestamps
    end
  end
end
