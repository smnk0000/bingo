require 'sinatra/base'
require 'active_record'
require_relative 'models/bingoGame'
require 'sinatra/reloader'

class Bingo < Sinatra::Base
	configure :development do
		register Sinatra::Reloader
	end

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

		#@numbers = Bingogame.all
		@numbers = Bingogame.where(:flg => true)
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

	get '/lottery' do
		#ビンゴを回す

		@sel_num = 0

		numbers = Bingogame.where(:flg => false)
		#rand(tmp.length).to_s

		if numbers.length > 0 then
			update_number = Bingogame.where(:num => numbers[rand(numbers.length)].num).first
			update_number.flg = true
			update_number.save

			@sel_num = update_number.num
		end

		erb :lottery
    #tmp[0].num.to_s + "      " + tmp[74].num.to_s


		#redirect "/"
	end

end
