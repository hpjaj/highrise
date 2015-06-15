class FileUpload < ActiveRecord::Base
  belongs_to :user

  def self.import(file, current_user_id)
    parsed_file = read_file(file)
    header_symbols = create_header_symbols(parsed_file) 
    parsed_file.delete_at(0)  # deletes headers from array
    create_data_in_database(parsed_file, header_symbols, current_user_id)
  end

  def self.calculate_gross_revenue(users_id)
    grouped_data = build_hash_of_grouped_uploads(users_id)
    filtered_group_data = add_upload_time_and_sort(grouped_data)
    filtered_group_data.each do |data_set|
      calculate_revenue_totals(data_set)
    end
    filtered_group_data
  end

  private

  def self.read_file(file)
    CSV.read(file.path, { :col_sep => "\t" })
  end

  def self.create_header_symbols(parsed_file)
    parsed_file[0].map { |attribute| attribute.split.join("_").to_sym }
  end

  def self.create_data_in_database(parsed_file, header_symbols, current_user_id)
    unique_upload_key = SecureRandom.base64
    parsed_file.each do |file_row|
      hash_of_attributes = {user_id: current_user_id, unique_upload_key: unique_upload_key }
      file_row.each_with_index do |attribute, index|
        hash_of_attributes[header_symbols[index]] = file_row[index]
      end
      FileUpload.create!(hash_of_attributes)
    end
  end

  def self.build_hash_of_grouped_uploads(users_id)
    self.where(user_id: users_id).group_by { |i| i.unique_upload_key }
  end

  def self.add_upload_time_and_sort(grouped_data)
    filtered_group_data = []
    grouped_data.each do |k,v|
      filtered_group_data << [v.first.created_at.strftime("%m/%d/%y at %l:%M%p"), v]
    end
    filtered_group_data.sort! { |x,y| y <=> x }
  end

  def self.calculate_revenue_totals(data_set)
    totals = []
    data_set[1].each do |object|
      totals << (object.purchase_count * object.item_price) 
    end  
    data_set << totals.reduce(:+) 
  end 

end