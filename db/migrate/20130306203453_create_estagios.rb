class CreateEstagios < ActiveRecord::Migration
  def change
    create_table :estagios do |t|
      t.float :bolsa

      t.timestamps
    end
  end
end
