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

=begin
		#挿入
		Bingogame.create!(:num => rand(74)+1,:flg => true)

		#検索
		@numbers = Bingogame.where(:id => 5)


		#findで更新
		tmp = Bingogame.find(5)
		tmp.flg = false
		tmp.save

		#whereで更新
		tmp = Bingogame.where(:id => 5).first
		tmp.flg = false
		tmp.save

		#id以外の条件で削除するならdestroy_all
		Bingogame.delete(3)
		Bingogame.destroy_all("num=63")
		Bingogame.destroy_all(:num => 24)
=end

		@numbers = Bingogame.all
		erb :index
	end

	get '/new' do
		#テーブル初期化
		Bingogame.destroy_all
		for i in 1..75 do
			Bingogame.create(:num => i, :flg => false)
		end
		erb :new
	end

end
