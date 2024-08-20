class CsvUploadService
    require 'csv'
  
    def call(file)
      errors = []
      opened_file = File.open(file)
      options = { headers: true, col_sep: ',' }
      CSV.foreach(opened_file, **options).with_index(2) do |row, row_number|
  
        product_hash = {}
        product_hash[:name] = row['Name']
        product_hash[:category] = row['Category']
        product_hash[:description] = row['Description']
        product_hash[:price_cents] = row['Price']
        product_hash[:currency] = row['Currency']
        product_hash[:url_id] = row['Url Id']

        product = Product.create(product_hash)
  
        if product.valid? == false
          errors << {row_number => product.errors.objects.first.full_message}
        end
      end
    end
  end