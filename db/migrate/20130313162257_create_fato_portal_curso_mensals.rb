class CreateFatoPortalCursoMensals < ActiveRecord::Migration
  def change
    create_table :fato_portal_curso_mensals do |t|
      t.integer :num_estagiarios_contratados
      t.float :taxa_de_aceitacao_contrado
      t.integer :num_estagiario_ativos
      t.references :calendario_mes
      t.references :curso

      t.timestamps
    end

    add_index :fato_portal_curso_mensals, :calendario_mes_id
    add_index :fato_portal_curso_mensals, :curso_id
  end
end
