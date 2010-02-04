# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Daimoku-Rails_session',
  :secret      => '783d9ce308c73f498dff42b191a00cb6ad42a990c83decf93894066b56b4172b48ba843e7024c2c137501e405d8a22e530380e40c30f1d6ff97ce523ae4f26aa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
