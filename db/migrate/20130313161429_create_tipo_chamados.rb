class CreateTipoChamados < ActiveRecord::Migration
  def change
    create_table :tipo_chamados do |t|
      t.string :nome

      t.timestamps
    end
  end
end
