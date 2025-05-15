class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products
  def index
    @products = Product.all
  end

  def report
    @products = Product.all

    pdf = Prawn::Document.new
    pdf.text "Lista de Produtos", size: 20, style: :bold
    pdf.move_down 20

    table_data = [ [ "Nome", "Preço", "Quantidade" ] ]
    @products.each do |product|
      table_data << [
        product.name,
        product.price,
        product.quantity
      ]
    end

    pdf.table(table_data, header: true, row_colors: [ "F0F0F0", "FFFFFF" ])

    send_data pdf.render,
      filename: "Produtos.pdf",
      type: "application/pdf",
      disposition: "attachment"
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy!
    redirect_to products_path, notice: "Product was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :price, :category_id, :image, :quantity, photos: [] ])
    end
end
