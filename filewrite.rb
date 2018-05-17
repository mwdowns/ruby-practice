file_name = "./sample.txt"
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

file_writer(file_name, "heyo, dude!", 5)
file_line_counter(file_name)