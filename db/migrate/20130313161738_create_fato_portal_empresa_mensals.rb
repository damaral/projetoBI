class CreateFatoPortalEmpresaMensals < ActiveRecord::Migration
  def change
    create_table :fato_portal_empresa_mensals do |t|
      t.integer :num_vagas
      t.integer :num_contratacoes
      t.integer :num_estagiarios
      t.float :num_medio_dias_contratacao
      t.integer :num_demissoes_voluntarias
      t.integer :num_demissoes_involuntarias
      t.references :empresa
      t.references :calendario_mes

      t.timestamps
    end

    add_index :fato_portal_empresa_mensals, :empresa_id
    add_index :fato_portal_empresa_mensals, :calendario_mes_id
  end
end
