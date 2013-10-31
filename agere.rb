require 'rubygems'
require 'sinatra'
require 'sinatra/config_file'

configure do
	config_file [ Dir.pwd, 'agere.yml' ].join('/')
	set :key, nil unless settings.respond_to? :key
end

get '/' do
	'Boop!'
end

# Your customized routes belong in local.rb. Look at local.rb.sample for an
# example.
require 'local.rb'

helpers do
	def authenticate!
		return true if params[:key] == settings.key
		halt 401, "Not authorized.\n"
	end
end
