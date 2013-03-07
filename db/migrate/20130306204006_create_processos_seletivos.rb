class CreateProcessosSeletivos < ActiveRecord::Migration
  def change
    create_table :processos_seletivos do |t|

      t.timestamps
    end
  end
end
