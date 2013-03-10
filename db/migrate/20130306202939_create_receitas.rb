class CreateReceitas < ActiveRecord::Migration
  def change
    create_table :receitas do |t|
      t.float :valor
      t.references :cliente
      t.references :calendario

      t.timestamps
    end

    add_index :receitas, :cliente_id
    add_index :receitas, :calendario_id
  end
end
