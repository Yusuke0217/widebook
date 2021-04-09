class PaymentsController < ApplicationController
  before_action :logged_in_owner, only: [:index, :new, :show, :edit, :update, :create_subscription, :destroy]
  before_action :correct_owner, only: [:index, :show, :new, :edit, :create_subscription, :update, :destroy]
  before_action :owner_payment, only: [:edit, :update, :destroy]
  before_action :subscription_restart, only: [:new]

  def index
  end

  def show
    @owner = Owner.find_by(id: current_owner.id)
  end

  def new
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: 'price_1IbFDRKq0R2J2RtxpxRyhU0N',
        quantity: 1,
      }],
      mode: 'subscription',
      success_url: request.base_url + '/payments/create_subscription?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: request.base_url + payments_subscription_error_path,
    })
  end
    
  def create_subscription
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @stripe_subscription = Stripe::Subscription.retrieve(@session.subscription)
    Stripe::Subscription.update(
      @stripe_subscription.id,
      trial_end: Time.zone.now.next_day(60).to_i,
      metadata: {
        date: Time.zone.now,
      },
    )
    @payment = Payment.new(
      owner_id: @owner.id,
      stripe_customer_id: @session.customer,
      stripe_plan_id: 'price_1IbFDRKq0R2J2RtxpxRyhU0N',
      stripe_subscription_id: @session.subscription,
      stripe_subscription_status: @stripe_subscription.status,
      active_until: Time.zone.at(@stripe_subscription.current_period_end),
    )
    if @payment.save
      flash[:success] = 'お支払いが完了いたしました。引き続き、Wideをお楽しみください。'
      redirect_to dashboards_path(@owner)
    else
      flash[:danger] = "お支払いに失敗しました。"
      render "index"
    end

  end

  def edit
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price: 'price_1IbFDRKq0R2J2RtxpxRyhU0N',
        quantity: 1,
      }],
      mode: 'subscription',
      success_url: request.base_url + '/payments/update_subscription?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: request.base_url + payments_subscription_error_path,
    })
  end

  def update
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @stripe_subscription = Stripe::Subscription.retrieve(@owner.payment.stripe_subscription_id)
    Stripe::Subscription.update(
      @stripe_subscription.id,
      trial_end: 'now',
      metadata: {
        date: Time.zone.now,
        status: "active",
      },
    )
    @payment.update_attributes(stripe_subscription_id: @stripe_subscription.id, stripe_subscription_status: "active")
    if @payment.save
      flash[:success] = 'お支払いが完了いたしました。引き続き、Wideをお楽しみください。'
      redirect_to dashboards_path(@owner)
    else
      flash[:danger] = "お支払いに失敗しました。"
      render "index"
    end
  end
  
  def destroy
    @stripe_subscription = Stripe::Subscription.retrieve(@payment.stripe_subscription_id)
    Stripe::Subscription.update(
      @payment.stripe_subscription_id,
      metadata: {
        date: Time.zone.now,
        status: 'canseled',
      },
    )
    @payment.update_attributes(stripe_subscription_status: "canseled")
    flash[:success] = "有料プランを解約いたしました。契約期間終了までは、引き続きご利用いただけます。"
    redirect_to dashboards_path(@owner)
  end

  def error
  end

  private

    def owner_payment
      @payment = Payment.find_by(owner_id: @owner.id)
    end

end
