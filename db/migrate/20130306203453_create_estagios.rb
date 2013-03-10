class CreateEstagios < ActiveRecord::Migration
  def change
    create_table :estagios do |t|
      t.float :bolsa
      t.references :estagiario
      t.integer :cliente_empresa_id
      t.integer :cliente_instituicao_id

      t.timestamps
    end

    add_index :estagios, :cliente_empresa_id
    add_index :estagios, :cliente_instituicao_id
  end
end
