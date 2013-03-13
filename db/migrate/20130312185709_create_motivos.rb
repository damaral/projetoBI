class CreateMotivos < ActiveRecord::Migration
  def change
    create_table :motivos do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
