class CreateWeighings < ActiveRecord::Migration[7.1]
  def change
    create_table :weighings do |t|
      t.decimal :value

      t.timestamps
    end
  end
end
