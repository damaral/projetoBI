class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.float :valor
      t.text :descricao

      t.timestamps
    end
  end
end
