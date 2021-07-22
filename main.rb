require 'sinatra'
require 'sinatra/reloader'
require 'securerandom'
require 'json'
require 'pry'
class Memo
  def self.create(title:, content:)
    memo_contents = {id: SecureRandom.uuid, title: title, content: content}
    File.open("./memos/#{memo_contents[:id]}.json", "w") {|file| file.puts JSON.pretty_generate(memo_contents)}
  end

  def self.find(id:)
    JSON.parse(File.open("./memos/#{id}.json").read, symbolize_names: true)
  end

  def update(id:, title:, content:)
    new_contents = {id: id, title: title, content: content}
    File.open("./memos/#{new_contents[:id]}.json", "w") do |file|
      puts JSON.pretty_generate(file)
    end
  end

  def destroy
    File.delete("./memos/#{id}.json")
  end

end

# メモの一覧（トップページ）へのルーティング
get '/memos' do
  memo_list = Dir.glob('./memos/*')
  @memos = memo_list.map{|memo| JSON.parse(File.read(memo), symbolize_names: true)}
  erb :index
end

# メモの新規投稿へのルーティング
get '/memos/new' do
  erb :new
end

post '/memos/new' do
  Memo.create(title: params[:title], content: params[:content])
  redirect '/memos'
  erb :new
end

# メモの詳細ページへのルーティング
# binding.pry
get '/memos/:id' do
  @memo = Memo.find(id: params[:id])
  erb :show
end

# メモの編集ページへのルーティング
get '/memos/:id/edit' do
  @memo = Memo.find(id: params[:id])
  erb :edit
end

# メモの更新
patch '/memos/:id' do
  @memo = Memo.update
  redirect '/memos'
  erb :edit
end

# メモの削除
delete '/memos/:id' do
  Memo.destroy
  redirect '/memos'
end
