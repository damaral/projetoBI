class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.string :status

      t.timestamps
    end
  end
end
