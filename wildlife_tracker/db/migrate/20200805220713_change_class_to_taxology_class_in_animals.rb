class ChangeClassToTaxologyClassInAnimals < ActiveRecord::Migration[6.0]
  def change
    rename_column :animals, :class, :taxonomy_class
  end
end
