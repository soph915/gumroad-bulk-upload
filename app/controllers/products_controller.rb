class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def upload
    return redirect_to products_path, alert: 'No file added' if params[:file].nil?
    return redirect_to products_path, alert: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

    CsvUploadService.new.call(params[:file])

    redirect_to products_path, notice: 'Upload started...'
  end
end
