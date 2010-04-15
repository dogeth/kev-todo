# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kev-todo_session',
  :secret      => '9c9cb88161ed0567ef95659bc61d8893320d475f95ccd9f5e5bb3a8c299604c2487e36c2cc49cbc593f0995a2ff57def55065a7f949bf0e4758ae24568864ab4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
