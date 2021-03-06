class SaleTransactionsController < ApplicationController
  before_action :set_sale_transaction, only: %i[ show edit update destroy ]

  # GET /sale_transactions or /sale_transactions.json
  def index
    @sale_transactions = SaleTransaction.all
  end

  # GET /sale_transactions/1 or /sale_transactions/1.json
  def show
    @product = Product.all
    
  end

  # GET /sale_transactions/new
  def new
    @sale_transaction = SaleTransaction.new
    @customer = Customer.all
  end

  # GET /sale_transactions/1/edit
  def edit
    @customer = Customer.all
  end

  # POST /sale_transactions or /sale_transactions.json
  def create
    @sale_transaction = SaleTransaction.new(sale_transaction_params)

    respond_to do |format|
      if @sale_transaction.save
        format.html { redirect_to @sale_transaction, notice: "Sale transaction was successfully created." }
        format.json { render :show, status: :created, location: @sale_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_transactions/1 or /sale_transactions/1.json
  def update
    respond_to do |format|
      if @sale_transaction.update(sale_transaction_params)
        format.html { redirect_to @sale_transaction, notice: "Sale transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @sale_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_transactions/1 or /sale_transactions/1.json
  def destroy
    @sale_transaction.destroy
    respond_to do |format|
      format.html { redirect_to sale_transactions_url, notice: "Sale transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_transaction
      @sale_transaction = SaleTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_transaction_params
      params.require(:sale_transaction).permit(:customer_id)
    end
end
