class CreateClassworks < ActiveRecord::Migration[5.2]
  def change
    create_table :classworks do |t|
      t.string :classname
      t.string :w_day
      t.string :period
      t.string :professor_name

      t.timestamps
    end
  end
end
