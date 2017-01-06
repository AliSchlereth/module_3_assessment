class SearchController < ApplicationController

  def index
    stores_info = Store.get_stores_by_zip(params[:search])
    @stores = stores_info[0]
    @counts = stores_info[-1]
  end

end
