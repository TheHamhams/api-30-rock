class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :season_num
      t.integer :episode_num

      t.timestamps
    end
  end
end
