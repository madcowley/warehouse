# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 10) do

  create_table "avatars", :force => true do |t|
    t.string  "content_type"
    t.string  "filename"
    t.integer "size"
    t.integer "parent_id"
    t.string  "thumbnail"
    t.integer "width"
    t.integer "height"
  end

  create_table "changes", :force => true do |t|
    t.integer "changeset_id"
    t.string  "name"
    t.text    "path"
    t.text    "from_path"
    t.integer "from_revision"
  end

  add_index "changes", ["changeset_id"], :name => "index_changes_on_changeset_id"

  create_table "changesets", :force => true do |t|
    t.integer  "revision"
    t.string   "author"
    t.text     "message"
    t.datetime "changed_at"
    t.integer  "repository_id"
  end

  add_index "changesets", ["repository_id"], :name => "index_changesets_on_repository_id"

  create_table "memberships", :force => true do |t|
    t.integer "user_id"
    t.integer "repository_id"
    t.boolean "active"
    t.boolean "admin"
    t.string  "login"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.binary  "server_url"
    t.string  "handle"
    t.binary  "secret"
    t.integer "issued"
    t.integer "lifetime"
    t.string  "assoc_type"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.string  "nonce"
    t.integer "created"
  end

  create_table "open_id_authentication_settings", :force => true do |t|
    t.string "setting"
    t.binary "value"
  end

  create_table "permissions", :force => true do |t|
    t.integer "repository_id"
    t.integer "user_id"
    t.boolean "active"
    t.boolean "full_access"
    t.string  "path"
  end

  create_table "repositories", :force => true do |t|
    t.string  "name"
    t.string  "path"
    t.string  "subdomain"
    t.boolean "public"
  end

  create_table "users", :force => true do |t|
    t.string  "name"
    t.string  "identity_url"
    t.boolean "admin"
    t.integer "avatar_id"
    t.string  "avatar_path"
    t.string  "email"
    t.string  "token"
  end

end
