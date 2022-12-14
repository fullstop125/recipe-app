
ActiveRecord::Schema[7.0].define(version: 20_221_213_200_104) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'foods', force: :cascade do |t|
    t.string 'name'
    t.string 'measurement_unit'
    t.integer 'price'
    t.integer 'quantity'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_foods_on_user_id'
  end

  create_table 'recipe_foods', force: :cascade do |t|
    t.integer 'quantity'
    t.bigint 'recipe_id', null: false
    t.bigint 'food_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['food_id'], name: 'index_recipe_foods_on_food_id'
    t.index ['recipe_id'], name: 'index_recipe_foods_on_recipe_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'name'
    t.datetime 'preparation_time'
    t.datetime 'cooking_time'
    t.text 'description'
    t.boolean 'public'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_recipes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'foods', 'users'
  add_foreign_key 'recipe_foods', 'foods'
  add_foreign_key 'recipe_foods', 'recipes'
  add_foreign_key 'recipes', 'users'
end
