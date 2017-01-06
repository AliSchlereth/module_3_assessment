class StoresController < ApplicationController

  def show
    @store = Store.get_store_by_id(params)
  end

end
