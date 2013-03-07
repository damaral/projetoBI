class CreateReceitas < ActiveRecord::Migration
  def change
    create_table :receitas do |t|
      t.float :valor

      t.timestamps
    end
  end
end
