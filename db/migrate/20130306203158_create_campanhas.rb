class CreateCampanhas < ActiveRecord::Migration
  def change
    create_table :campanhas do |t|
      t.string :tipo
      t.string :nome
      t.references :despesa

      t.timestamps
    end

    add_index :campanhas, :despesa_id
  end
end
