class HomeController < ApplicationController

  def index

  end

  def about
  end

  def show
    # @model = Message.find(params[:id])
    # @all_model = Message.all
    #
    # conn=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"ruby-example", :user=>"postgres", :password=>'Hello12#')
    # res = conn.exec("SELECT * FROM messages")
    # fieldArray = res.fields()
    #
    # connection = ActiveRecord::Base.connection
    # res2 = connection.execute("SELECT * FROM messages")
    # fieldArray2 = res2.fields()
    #
    # puts"fieldArray1"
    #
    # puts fieldArray
    #
    # puts"fieldArray2"
    #
    # puts fieldArray2
    #
    #
    # @temp = UserDetail.all
    #
    # puts"ACTIVE RECORD MODEL"
    #
    # puts UserDetail.all.size

  end

  private
  def post_params
    # :message is model name
    params.require(:message).permit(:message_id, :content)
  end
end
