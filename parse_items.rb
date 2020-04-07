require './item.rb'

class ParseItems
  MATCHER_LINE_ITEM = /(\d+)\s?(imported)? (.+) at (\d+).(\d+)/
  
  def self.from_file(filename)
    begin
      items = []
      file = File.open(filename)
      file_data = file.readlines.map(&:chomp)
      file_data.each do |line|
        item = MATCHER_LINE_ITEM.match(line)
        items << Item.new(item[1].to_i, item[2], item[3], "#{item[4]}.#{item[5]}".to_f)
      end
      items
    rescue
      puts "There was an error trying to open the file. Check an try again."
    end
  end
end