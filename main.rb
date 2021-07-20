require 'sinatra'
require 'sinatra/reloader'

class Text

end

get '/' do
  @texts = Text.order("id desc").all
  erb :index
end

get '/show' do
  @text = Text.find(params[:id])
end

post '/new' do
  Text.create({:body => params[:body]})
  erb :new
end

post '/edit' do
  @text = Text.find(params[:id])
end

post '/delete' do
  Text.find(params[:id]).destroy
end




# get '/hello/*' do |name|
#   "hello #{name}. how are you?"
# end

# get '/erb_template_page' do
#   erb :erb_template_page
# end
