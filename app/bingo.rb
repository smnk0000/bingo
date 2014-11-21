require 'sinatra'
require 'active_record'
require_relative 'models/bingoGame'
require 'sinatra/reloader' if development?

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

		@numbers = Bingogame.all
		erb :index
	end

	get '/new' do
		#テーブル初期化
		Bingogame.destroy_all
		for i in 1..75 do
			Bingogame.create(:num => i, :flg => false)
		end
		redirect "/"
	end

end
