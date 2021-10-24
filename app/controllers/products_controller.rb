class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    
    def new
        @product = Product.new
    end
    
    def create
        user = User.find_by(uid: current_user.uid)
        @product = Product.new(message: params[:tweet][:message], user_id: user.id)
        if @product.save
          #TODO: ツイートが成功したことをユーザに知らせる
          redirect_to root_path
        else
          render 'new'
        end
    end
    
    def destroy
    end
end
