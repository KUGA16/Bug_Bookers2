class SearchController < ApplicationController
  def search
    @content = params["search"]["content"]
    @model = params["search"]["model"]
    @how = params["search"]["how"]
    @records = search_for(@how, @model, @content)
  end

  private

  def search_for(how, model, content)
    if model == 'user'
      if how == 'match' #完全一致
        User.where(name: content)
      elsif how == 'forward' #前方一致
        User.where("name LIKE ?", "#{content}%")
      elsif how == 'backward' #後方一致
        User.where("name LIKE ?", "%#{content}")
      else #部分一致
        User.where("name LIKE ?", "%#{content}%")
      end
    elsif model == 'book'
      if how == 'match' #完全一致
        Book.where(title: content)
      elsif how == 'forward' #前方一致
        Book.where("title LIKE ?", "#{content}%")
      elsif how == 'backward' #後方一致
        Book.where("title LIKE ?", "%#{content}")
      else #部分一致
        Book.where("title LIKE ?", "%#{content}%")
      end
    end
  end



  # def search_for(how, model, content)
  #   case how
  #   when 'match'
  #     match(model, content)
  #   when 'forward'
  #     forward(model, content)
  #   when 'backward'
  #     backward(model, content)
  #   when 'partical'
  #     partical(model, content)
  #   end
  # end
  #
  # def match(model, content)
  #   if model == 'user'
  #     User.where(name: content)
  #   elsif model == 'book'
  #     Book.where(title: content)
  #   end
  # end
  # #前方一致
  # def forward(model, content)
  #   if model == 'user'
  #     User.where("name LIKE ?", "#{content}%")
  #   elsif model == 'book'
  #     Book.where("title LIKE ?", "#{content}%")
  #   end
  # end
  # #後方一致
  # def backward(model, content)
  #   if model == 'user'
  #     User.where("name LIKE ?", "%#{content}")
  #   elsif model == 'book'
  #     Book.where("title LIKE ?", "%#{content}")
  #   end
  # end
  # #部分一致
  # def partical(model, content)
  #   if model == 'user'
  #     User.where("name LIKE ?", "%#{content}%")
  #   elsif model == 'book'
  #     Book.where("title LIKE ?", "%#{content}%")
  #   end
  # end
  #
end
