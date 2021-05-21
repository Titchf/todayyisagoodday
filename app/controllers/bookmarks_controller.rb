class BookmarksController < ApplicationController

    def index
        @bookmarks = Bookmark.all
      end
    
     def show
       @bookmark = Bookmark.find(params[:id])
      end

     def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy
       end

      def new
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new
          end

          def create
            @bookmark = Bookmark.new(bookmark_params)
            @list = List.find(params[:list_id])
            @bookmark.list = @list
            if @bookmark.save
            redirect_to list_path(@bookmark.list)
            else
            render :new
            end
          end

          private
        
          def bookmark_params
            params.require(:bookmark).permit(:comment, :movie_id)
          end
end
