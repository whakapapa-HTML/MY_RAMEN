class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table 'admins' do |t|
      t.string 'email', default: '', null: false
      t.string 'encrypted_password', default: '', null: false
      t.string 'reset_password_token'
      t.datetime 'reset_password_sent_at'
      t.datetime 'remember_created_at'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['email'], name: 'index_admins_on_email', unique: true
      t.index ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true
    end
    create_table 'bookmarks' do |t|
      t.integer 'user_id', null: false
      t.integer 'recipe_id', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['recipe_id'], name: 'index_bookmarks_on_recipe_id'
      t.index ['user_id'], name: 'index_bookmarks_on_user_id'
    end
    create_table 'contacts' do |t|
      t.integer 'user_id', null: false
      t.string 'title', null: false
      t.text 'body', null: false
      t.text 'reply'
      t.integer 'status', default: 0, null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
    create_table 'genres' do |t|
      t.string 'name', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.string 'genre_image', null: false
    end
    create_table 'impressions' do |t|
      t.string 'impressionable_type'
      t.integer 'impressionable_id'
      t.integer 'user_id'
      t.string 'controller_name'
      t.string 'action_name'
      t.string 'view_name'
      t.string 'request_hash'
      t.string 'ip_address'
      t.string 'session_hash'
      t.text 'message'
      t.text 'referrer'
      t.text 'params'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index %w[controller_name action_name ip_address], name: 'controlleraction_ip_index'
      t.index %w[controller_name action_name request_hash], name: 'controlleraction_request_index'
      t.index %w[controller_name action_name session_hash], name: 'controlleraction_session_index'
      t.index %w[impressionable_type impressionable_id ip_address], name: 'poly_ip_index'
      t.index %w[impressionable_type impressionable_id params], name: 'poly_params_request_index'
      t.index %w[impressionable_type impressionable_id request_hash], name: 'poly_request_index'
      t.index %w[impressionable_type impressionable_id session_hash], name: 'poly_session_index'
      t.index %w[impressionable_type message impressionable_id], name: 'impressionable_type_message_index'
      t.index ['user_id'], name: 'index_impressions_on_user_id'
    end
    create_table 'ingredients' do |t|
      t.integer 'recipe_id', null: false
      t.string 'name', null: false
      t.float 'amount', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.float 'per_amount', null: false
    end
    create_table 'procedures' do |t|
      t.integer 'recipe_id', null: false
      t.text 'explanation', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.string 'procedure_image'
    end
    create_table 'recipes' do |t|
      t.integer 'user_id', null: false
      t.integer 'genre_id', null: false
      t.string 'name', null: false
      t.text 'introduction', null: false
      t.integer 'serving', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.string 'recipe_image', null: false
      t.integer 'impressions_count', default: 0, null: false
    end
    create_table 'relationships' do |t|
      t.integer 'follower_id', null: false
      t.integer 'followed_id', null: false
    end
    create_table 'reviews' do |t|
      t.integer 'recipe_id', null: false
      t.integer 'user_id', null: false
      t.string 'title', null: false
      t.text 'body', null: false
      t.float 'evaluation', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end
    create_table 'users' do |t|
      t.string 'email', default: '', null: false
      t.string 'encrypted_password', default: '', null: false
      t.string 'reset_password_token'
      t.datetime 'reset_password_sent_at'
      t.datetime 'remember_created_at'
      t.string 'name', null: false
      t.text 'introduction'
      t.boolean 'is_deleted', default: false, null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['email'], name: 'index_users_on_email', unique: true
      t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, 'The initial migration is not revertable'
  end
end
