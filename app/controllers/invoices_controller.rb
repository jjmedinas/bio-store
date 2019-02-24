class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /invoices
  def index
    if current_user.seller?
      invoices = Invoice.where(seller_id: current_user.id)
    elsif current_user.buyer?
      invoices = Invoice.where(buyer_id: current_user.id)
    else
      return render json: {error: 'Unauthorized'}, status: 401
    end


    render json: map_invoices(invoices, current_user.role), status: 200
  end

  # GET /invoices/1
  def show
    render json: @invoice
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render json: @invoice, status: :created, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invoice_params
      params.require(:invoice).permit(:identifier, :seller_id, :buyer_id, :description, :total, :sending_address)
    end

    def map_invoices(invoices, user_role)
      key = "Compras"
      key = "ventas" if user_role == 'seller'

      {
        "#{key}": invoices.map{|i| serializer = InvoiceSerializer.new(i).attributes }
      }
    end
end
