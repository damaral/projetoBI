class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :email
      t.string :tipo_cliente
      t.string :cnpj
      t.references :campanha

      t.timestamps
    end

    add_index :clientes, :campanha_id
  end
end
