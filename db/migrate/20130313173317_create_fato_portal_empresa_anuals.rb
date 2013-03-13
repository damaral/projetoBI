class CreateFatoPortalEmpresaAnuals < ActiveRecord::Migration
  def change
    create_table :fato_portal_empresa_anuals do |t|
      t.float :salario_medio
      t.references :calendario_mes
      t.references :empresa

      t.timestamps
    end

    add_index :fato_portal_empresa_anuals, :calendario_mes_id
    add_index :fato_portal_empresa_anuals, :empresa_id
  end
end
