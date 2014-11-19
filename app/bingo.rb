require 'sinatra/base'
require 'active_record'
require_relative 'models/bingoGame'

class Bingo < Sinatra::Base

	set :public_folder, File.expand_path(File.join(root, '..', 'public'))

	helpers do
		def h(text)
			Rack::Utils.escape_html(text)
		end
	end


	configure do
		ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] ||'sqlite3:db/development.db')
	end

	get '/' do
		Bingogame.create!(:num => 12,:flg => true)
		@numbers = Bingogame.all
		erb :index
	end

	get '/new' do
		erb :new
	end

end
