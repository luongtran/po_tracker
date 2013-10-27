class ConvertCrmEmployeesToUsers < ActiveRecord::Migration

  def up
  	if (!ActiveRecord::Base.connection.tables.include?("contact_activities"))
	  create_table "contact_activities", :force => true do |t|
	    t.integer  "contact_id"
	    t.integer  "user_id"
	    t.string   "subject"
	    t.string   "product"
	    t.string   "action"
	    t.text     "content"
	    t.text     "notes"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
	  end
	  if (!ActiveRecord::Base.connection.tables.include?("contacts"))
	  create_table "contacts", :force => true do |t|
	    t.string   "first_name"
	    t.string   "last_name"
	    t.string   "email"
	    t.string   "telephone"
	    t.boolean  "contacted"
	    t.boolean  "receive_emails"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "key"
	    t.integer  "customer_id"
	    t.boolean  "follow_up_required"
	    t.integer  "assigned_user_id"
	  end

	  end
	  if (!ActiveRecord::Base.connection.tables.include?("customers"))
	  create_table "customers", :force => true do |t|
	    t.string   "name"
	    t.text     "notes"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  end
	  if (!ActiveRecord::Base.connection.tables.include?("features"))
	  create_table "features", :force => true do |t|
	    t.string   "name"
	    t.integer  "program_id"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  end
	  if (!ActiveRecord::Base.connection.tables.include?("guids"))
	  create_table "guids", :force => true do |t|
	    t.boolean  "acknowledged"
	    t.string   "guid"
	    t.string   "program_name"
	    t.string   "license"
	    t.text     "machine_data"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end

	  end
	  if (!ActiveRecord::Base.connection.tables.include?("invoices"))
	  create_table "invoices", :force => true do |t|
	    t.string   "customer_po_number"
	    t.integer  "customer_id"
	    t.datetime "date"
	    t.text     "notes"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "contact_id"
	    t.string   "invoice_number"
	  end

	  end
	  if (!ActiveRecord::Base.connection.tables.include?("licenses"))
	  create_table "licenses", :force => true do |t|
	    t.integer  "customer_id"
	    t.integer  "program_id"
	    t.integer  "license_no"
	    t.text     "license_data"
	    t.string   "one_time_password"
	    t.boolean  "used"
	    t.integer  "created_by"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "contact_id"
	    t.integer  "invoice_id"
	    t.text     "notes"
	    t.datetime "licensed_on"
	  end

	  end
	  if (!ActiveRecord::Base.connection.tables.include?("programs"))
	  create_table "programs", :force => true do |t|
	    t.string   "program_name"
	    t.string   "version"
	    t.string   "salt"
	    t.integer  "created_by"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.string   "encryption_type"
	    t.string   "download_file_name"
	    t.string   "download_content_type"
	    t.integer  "download_file_size"
	    t.string   "download_build"
	    t.integer  "updated_by"
	  end

	  end
	  if (!ActiveRecord::Base.connection.tables.include?("users"))
	  create_table "users", :force => true do |t|
	    t.string   "first_name"
	    t.string   "last_name"
	    t.string   "mi"
	    t.string   "login"
	    t.string   "crypted_password"
	    t.string   "salt"
	    t.string   "email"
	    t.string   "telephone"
	    t.string   "fax"
	    t.string   "cell"
	    t.string   "remember_token"
	    t.datetime "remember_token_expires_at"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
	  end
	  execute 'insert into employees (company_id,role,first_name,last_name,mi,login,crypted_password,salt,email,telephone,fax,remember_token,remember_token_expires_at,created_at,updated_at) 
	  SELECT (select id from companies limit 1) as company_id, 0 as role, first_name,last_name,mi,login,crypted_password,salt,email,telephone,fax,remember_token,remember_token_expires_at,created_at,updated_at from users;'
  end

  def down
  end
end
