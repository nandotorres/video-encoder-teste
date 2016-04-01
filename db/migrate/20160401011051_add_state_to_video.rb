class AddStateToVideo < ActiveRecord::Migration
  def change
    change_table(:videos) do |t|
      t.string :state, default: :pending
    end

    add_index :videos, :state
  end

  def down
    remove_column :videos, :state
  end
end
