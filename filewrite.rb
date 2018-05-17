file_name = "./sample.txt"
File.open(file_name, 'r+') do |file_handle|
    10.times do |index|
        line = "yo, dude!\n"
        file_handle <<  line
    end
end
File.open(file_name, 'r') do |file_handle|
    arr = file_handle.read.split("\n").length
    puts arr
end