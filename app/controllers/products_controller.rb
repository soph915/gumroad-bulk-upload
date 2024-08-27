class ProductsController < ApplicationController
  require "money"

  def index
    @products = Product.all
  end

  def upload
    @csv_errors = []
    return redirect_to products_path, alert: "No file added" if params[:file].nil?
    return redirect_to products_path, alert: "Only CSV files allowed" unless params[:file].content_type == "text/csv"

    csv_service = CsvUploadService.new.call(params[:file])

    if csv_service[0].empty? == false
      csv_errors = csv_service[0].join(", ")
      return redirect_to products_path, notice: "#{csv_service[1]} products added.", alert: "Error: #{csv_errors}"
    end

    redirect_to products_path, notice: "#{csv_service[1]} products added."
  end
end
