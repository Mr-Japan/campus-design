class ClassworksController < ApplicationController
    
    def home
        render "classworks/home"
    end
    
    def search
        
       # @classwork = Classwork.where('class_name LIKE ?': "%#{params[:class_name]}%", 'professor_name LIKE?': "%#{params[:professor_name]}%" ,w_day : params[:w_day], period: params[:period])
       # @classwork = Classwork.where('class_name LIKE ? and professor_name LIKE ?' , "%#{params[:class_name]}%" , "%#{params[:professor_name]}%" ).where(w_day: params[:w_day], period: params[:period])
       # @classwork = Classwork.where('class_name LIKE ? and professor_name LIKE ? and w_day = ? and period = ?' , "%#{params[:class_name]}%" , "%#{params[:professor_name]}%",  params[:w_day], params[:period])
       # @classwork = Classwork.where('class_name LIKE ? and professor_name LIKE ?' , "%#{params[:class_name]}%" , "%#{params[:professor_name]}%" ).where(w_day: params[:w_day], period: params[:period])
        query = ""
        values = []
        if params[:w_day].present?
            query += "w_day = ? and "   #select * from "テーブル名"　where "カラム名" = "値(?/LIKE)" and "カラム名" = "値(?/LIKE)"
            values.push(params[:w_day])
        end
        if params[:period].present?
            query += "period = ? and " 
            values.push(params[:period])
        end
        if params[:class_name].present?
            query += "class_name LIKE ? and "
            values.push("%#{params[:class_name]}%")
        end
        if params[:professor_name].present?
            query += "professor_name LIKE ? and "
            values.push("%#{params[:professor_name]}%")
            # "%" + params[:professor_name] + "%"
        end
        query = query.sub(/\sand\s\z/, "")

        @classwork = Classwork.where(query, *values)
        # binding.pry
        render "classworks/index"
    end
    
    def show
        @classwork = Classwork.find_by(id: params[:id])
        if @classwork.nil?
            abort 404
        end
        #sbinding.pry
        @favorite = Favorite.find_by(classwork_id: @classwork.id, user_id: current_user.id)
        
        render "classworks/show"
    end
    
     def index
        render "classworks/index"
     end
    

end

