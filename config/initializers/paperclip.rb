# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
require "paperclip"  
Paperclip.options[:command_path] = 'C:\\Program Files (x86)\\ImageMagick-6.8.9-Q16' 
Paperclip.options[:swallow_stderr] = false