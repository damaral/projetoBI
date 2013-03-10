class CreatePatrimonios < ActiveRecord::Migration
  def change
    create_table :patrimonios do |t|
      t.references :despesa

      t.timestamps
    end

    add_index :patrimonios, :despesa_id
  end
end
