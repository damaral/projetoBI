class CreateFatoCrmKpis < ActiveRecord::Migration
  def change
    create_table :fato_crm_kpis do |t|
      t.float :receita_adquirida
      t.integer :clientes_adquiridos
      t.float :cac
      t.float :despesas_marketing
      t.float :roi
      t.integer :numero_de_campanhas
      t.float :receita_por_campanha
      t.references :calendario_mes

      t.timestamps
    end

    add_index :fato_crm_kpis, :calendario_mes_id
  end
end
