# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
api_mime_types = %W(
  application/vnd.api+json
  text/x-json
  application/json
)
Mime::Type.register 'application/vnd.api+json', :json, api_mime_types
# Mime::Type.register "application/json", :json, %w( text/x-json application/jsonrequest application/vnd.api+json )