# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rails3MongoidDevise::Application.initialize!

SITE_NAME = Setting.app_name
SITE_KEYWORDS = Setting.app_keywords
SITE_DESCRIPION = Setting.app_description