# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rails3MongoidDevise::Application.initialize!

SITE_NAME = Setting.app_name