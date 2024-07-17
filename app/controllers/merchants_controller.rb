class MerchantsController < ApplicationController
  def index
    @merchants = MerchantFacade.new.all_merchants
  end

  def show
    @merchant = Merchant.find(params[:id])
  end
end