class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.string :status
      t.references :funcionario

      t.timestamps
    end

    add_index :chamados, :funcionario_id
  end
end
