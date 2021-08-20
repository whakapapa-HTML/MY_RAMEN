class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @model = params['model']
    @content = params['content']
    @records = search_for(@model, @content)
  end

  private

  def search_for(model, content)
    if model == 'user'
      User.where('name LIKE(?)', "%#{content}%")
    elsif model == 'recipe'
      Recipe.where('name LIKE(?)', "%#{content}%")
    end
  end
end
