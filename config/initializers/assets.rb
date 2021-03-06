# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path


Rails.application.config.assets.precompile += %w[tags.js]
Rails.application.config.assets.precompile += %w[responsive_display.js]
Rails.application.config.assets.precompile += %w[image_cropper.js]
Rails.application.config.assets.precompile += %w[tasks_manager.js]
Rails.application.config.assets.precompile += %w[product_tiles.js]
Rails.application.config.assets.precompile += %w[show_gallery.js]