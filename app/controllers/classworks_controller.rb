class ClassworksController < ApplicationController
    
    def home
         render "classworks/home"
    end
    
    def index
        render "classworks/index"
    end
    
    def show
        render "classworks/show"
    end
    
end
