class AddAuthorReferenceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :author, foreign_key:true, index:true
  end
end
