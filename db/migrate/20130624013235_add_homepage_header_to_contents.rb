class AddHomepageHeaderToContents < ActiveRecord::Migration
  def up
    Content.create(title: "homepage_header")
  end

  def down
    Content.where(title: "homepage_header").first.destroy
  end
end
