class CreateTableStructure < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.string(:prep_time)
      t.string(:cook_time)
      t.string(:name)
      t.text(:instructions)
      t.timestamps()
    end

    create_table(:ingredients) do |t|
      t.string(:name)
      t.integer(:quantity)
      t.string(:portion_size)
      t.timestamps()
    end

    create_table(:tags) do |t|
      t.string(:name)
    end

    create_join_table(:recipes, :tags) do |t|
      t.timestamps()
    end

    create_join_table(:ingredients, :recipes) do |t|
      t.timestamps()
    end
  end
end
