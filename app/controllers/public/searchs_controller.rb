class Public::SearchsController < ApplicationController
    
    def search
      @model = params["model"]
      @content = params["content"]
      @method = params["method"]
      @records = search_for(@model, @content, @method)
    end
    
    private
    def search_for(model, content, method)
      if model == 'user'
        if method == 'perfect'
          User.where(name: content)
        else
          User.where('name LIKE ?', "%#{content}%")
        end
      elsif model == 'post'
        if method == 'perfect'
          Post.where(body: content)
        else
          Post.where('body LIKE ?', "%#{content}%")
        end
      end
    end
    
end
