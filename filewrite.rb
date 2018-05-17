puts "what what's the filename you'd like to create?\n"
file_name = "./" << gets.chomp
puts "what would you like to say?\n"
str = gets.chomp
puts "how many times would you like to say it?\n"
num = gets.to_i
def file_writer(file_name, str, num)
    line = str << "\n"
    File.open(file_name, 'r+') do |file_handle|
        num.times do
            file_handle <<  line
        end
    end
end

def file_line_counter(file_name)
    File.open(file_name, 'r') do |file_handle|
        arr = file_handle.read.split("\n").length
        puts arr
    end
end

file_writer(file_name, str, num)
file_line_counter(file_name)