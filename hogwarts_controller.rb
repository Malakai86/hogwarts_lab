require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( './models/students' )
also_reload( './models/*' )

get '/students' do #index
  @students = Student.all()
  erb( :index )
end

get '/students/new' do #new
  erb(:new)
end


post '/students' do #create
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

get '/students/:id' do #show
  @student = Student.find( params['id'])
  erb(:show)
end
