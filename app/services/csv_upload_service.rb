class CsvUploadService
    require 'csv'
  
    def call(file)
      opened_file = File.open(file)
      options = { headers: true, col_sep: ',' }
      CSV.foreach(opened_file, **options) do |row|
  
        product_hash = {}
        product_hash[:name] = row['Name']
        product_hash[:category] = row['Category']
        product_hash[:description] = row['Description']
        product_hash[:price_cents] = row['Price']
        product_hash[:currency] = row['Currency']
        product_hash[:url_id] = row['Url Id']
  
        Product.find_or_create_by!(product_hash)
      end
    end
  end