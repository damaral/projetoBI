class CreateFatoRhProdutividades < ActiveRecord::Migration
  def change
    create_table :fato_rh_produtividades do |t|
      t.float :receita_total
      t.integer :num_estagiarios
      t.integer :num_funcionarios
      t.float :produtividade_total
      t.float :produtividade_real
      t.references :calendario_mes

      t.timestamps
    end

    add_index :fato_rh_produtividades, :calendario_mes_id
  end
end
