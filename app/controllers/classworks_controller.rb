class ClassworksController < ApplicationController
    
    def home
        render "classworks/home"
    end
    
    def search
        #p "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @classwork = Classwork.where(class_name: params[:class_name]).where(professor_name: params[:professor_name])
        #binding.pry
        redirect_to classworks_index_path
    end
    
    def show
        render "classworks/show"
    end
    
     def index
        render "classworks/index"
    end
    
end

