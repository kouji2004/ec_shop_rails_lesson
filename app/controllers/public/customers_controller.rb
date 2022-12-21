class Public::CustomersController < ApplicationController


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kata, :first_name_kata, :post_code, :address, :phone_number, :email)
  end
end
