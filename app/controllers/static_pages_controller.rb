class StaticPagesController < ApplicationController

  def about
    render 'about', layout: false
  end

  def profile
    if current_user.present?
      @user = current_user
      tracking_link_customers = Lead.all.where(tracking_link: @user.tracking_id).count
      tracking_id_customers = Lead.all.where(affiliation_id: @user.tracking_id).count
      @all_affiliation_customer_for_certain_user = tracking_link_customers + tracking_id_customers
      @user_tracking_id = @user.tracking_id
      @user_tracking_link = leads_new_path(id: @user_tracking_id)
    end
  end

  def tracking_link
    @tracking_id = current_user.tracking_id
    @tracking_link = leads_new_path(id: @tracking_id)
  end

  def terms_of_use
    if current_user.present?
      @user = current_user
    end
  end

  def affiliation_agreement
    if current_user.present?
      @user = current_user
    end
  end

  def new_lead_confirmation
    render 'new_lead_confirmation', layout: 'adwords_layout'
  end

  def wallet_payment
    @order = Order.find_by_id(params[:order])
  end

  def info
  end

  def welcome
  end

  def faq
  end

  def payment_confirmation
  end


end
