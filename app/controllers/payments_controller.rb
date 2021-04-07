class PaymentsController < ApplicationController
  before_action :logged_in_owner, only: [:new, :create, :destroy]
  before_action :find_owner, only: [:index, :new, :create_subscription, :destroy]

  def index
  end

  def show
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
      # @session.subscription,
      trial_end: Time.zone.now.next_day(60).to_i,
    )
    @payment = Payment.new(
      owner_id: @owner.id,
      stripe_customer_id: @session.customer,
      stripe_plan_id: 'price_1IbFDRKq0R2J2RtxpxRyhU0N',
      stripe_subscription_id: @session.subscription,
      active_until: Time.zone.at(@stripe_subscription.current_period_end),
    )
    if @payment.save
      flash[:success] = 'お支払いが完了いたしました。引き続き、Wideをお楽しみください。'
      redirect_to dashboards_path(@owner)
    else
      render "new"
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def error
  end

  private

    def find_owner
      @owner = current_owner
    end

end
