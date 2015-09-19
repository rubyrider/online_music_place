class Backend
  class SubscriptionsController < BackendController
    before_action :set_backend_subscription, only: [:show, :edit, :update, :destroy]

    # GET /backend/subscriptions
    # GET /backend/subscriptions.json
    def index
      @subscriptions = Subscription.all
    end

    # GET /backend/subscriptions/1
    # GET /backend/subscriptions/1.json
    def show
    end

    # GET /backend/subscriptions/new
    def new
      @subscription = Subscription.new
    end

    # GET /backend/subscriptions/1/edit
    def edit
    end

    # POST /backend/subscriptions
    # POST /backend/subscriptions.json
    def create
      @subscription = Subscription.new(backend_subscription_params)

      respond_to do |format|
        if @subscription.save
          format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
          format.json { render :show, status: :created, location: @subscription }
        else
          format.html { render :new }
          format.json { render json: @subscription.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /backend/subscriptions/1
    # PATCH/PUT /backend/subscriptions/1.json
    def update
      respond_to do |format|
        if @subscription.update(backend_subscription_params)
          format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
          format.json { render :show, status: :ok, location: @subscription }
        else
          format.html { render :edit }
          format.json { render json: @subscription.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /backend/subscriptions/1
    # DELETE /backend/subscriptions/1.json
    def destroy
      @subscription.destroy
      respond_to do |format|
        format.html { redirect_to backend_subscriptions_url, notice: 'Subscription was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_subscription_params
      params[:subscription]
    end
  end
end
