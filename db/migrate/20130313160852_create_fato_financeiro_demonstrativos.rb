class CreateFatoFinanceiroDemonstrativos < ActiveRecord::Migration
  def change
    create_table :fato_financeiro_demonstrativos do |t|
      t.float :receita_total
      t.float :custos_variaveis
      t.float :custos_fixos
      t.float :impostos
      t.float :lucro
      t.references :calendario_mes

      t.timestamps
    end

    add_index :fato_financeiro_demonstrativos, :calendario_mes_id
  end
end
