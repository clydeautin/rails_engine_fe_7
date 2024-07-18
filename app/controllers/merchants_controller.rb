class MerchantsController < ApplicationController
  def index
    @merchants = MerchantFacade.new.all_merchants
  end

  def show
    # require 'pry'; binding.pry
    @merchant = MerchantFacade.new.one_merchant_by_id(params[:merchant_id])
    @merchant_items = MerchantFacade.new.merchant_items(params[:merchant_id])
  end
end