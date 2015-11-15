require 'nokogiri'
require 'open-uri'
require 'json'

current_week_number = Date.today.strftime("%W").to_i
@page_url = "http://217.78.137.198:64004/c/#{current_week_number}"
@dump_file = './dist/classes.json'

def uids
  puts 'starting fetching..'
  uids = []

  p '# Step 1/4: Fetching all uids..'
  doc = Nokogiri::HTML(open(@page_url))
  doc.css('a').each do |link|
    link_url = link.attributes['href'].to_s
    if link_url =~ /\.htm/
      uid = link_url.gsub('.htm', '')
      uids.push(uid)
    end
  end

  p "Finished fetching #{uids.count} uids.."
  uids
end

def classes
  puts '# Step 2/4: Start getting class names..'
  uids_cached = uids

  classes = []
  uids_cached.each_with_index do |uid, index|
    puts  "Fetching class name #{index + 1}/#{uids_cached.count}"
    doc = Nokogiri::HTML(open("#{@page_url}/#{uid}"))

    font_tags = doc.css('html body.tt center font')
    font_tags[0..2].each do |font_tag|
      color = font_tag.attributes['color'].to_s
      size = font_tag.attributes['size'].to_s
      font_face = font_tag.attributes['face'].to_s
      if font_face == 'Arial' && size == '5'
        content = font_tag.text
        class_name = content.gsub("\r\n", '').gsub("\u00A0", '')
        classes.push(name: class_name, uid: uid)
      end
    end

    if font_tags.empty?
      puts "no class title found on: #{@page_url}/#{uid}"
    end
  end

  classes
end

def dump_data
  classes_data = classes
  classes_data = classes_data.sort_by{|e| e[:name]}
  puts  "# Step 3/4: saving to #{@dump_file}"
  File.open(@dump_file, 'w') do |f|
    f.write(classes_data.to_json)
  end
  puts "saved #{classes_data.size} entries to file"
end

dump_data