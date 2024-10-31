class Public::SearchsController < ApplicationController
    
    def search
      @model = params["model"]
      @content = params["content"]
      @group = params["group"]
      @method = params["method"]
      @records = search_for(@model, @content, @group, @method)
    end
    
    private
    def search_for(model, content, group, method)
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
      else model == 'community'
        if method == 'perfect'
          Community.where(name: content)
        else
          Community.where('name LIKE ?', "%#{content}%")
        end
      end
    end
    
end
