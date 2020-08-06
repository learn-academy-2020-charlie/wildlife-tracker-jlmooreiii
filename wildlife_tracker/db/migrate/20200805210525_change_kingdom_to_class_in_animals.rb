class ChangeKingdomToClassInAnimals < ActiveRecord::Migration[6.0]
  def change
    rename_column :animals, :kingdom, :class
  end
end
