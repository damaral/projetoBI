class CreateFatoPortalCursoEmpresaMensals < ActiveRecord::Migration
  def change
    create_table :fato_portal_curso_empresa_mensals do |t|
      t.float :fracao_estagiarios
      t.references :calendario_mes
      t.references :empresa
      t.references :curso

      t.timestamps
    end

    add_index :fato_portal_curso_empresa_mensals, :calendario_mes_id
    add_index :fato_portal_curso_empresa_mensals, :empresa_id
    add_index :fato_portal_curso_empresa_mensals, :curso_id
  end
end
