class FileWriteRead
    
    def initialize(file_name, str, num)
        @file_name = file_name
        @str = str
        @num = num
    end

    attr_reader :file_name
    attr_reader :str
    attr_reader :num

    def file_writer()
        line = str << "\n"
        File.open(file_name, 'r+') do |file_handle|
            num.times do
                file_handle <<  line
            end
        end
    end

    def file_line_counter()
        File.open(file_name, 'r') do |file_handle|
            numOfLines = file_handle.read.split("\n").length
            puts "File is #{numOfLines} long!"
        end
    end

end

def dialogue ()
    puts "what what's the filename you'd like to create?\n"
    file_name = "./" << gets.chomp
    puts "what would you like to say?\n"
    str = gets.chomp
    puts "how many times would you like to say it?\n"
    num = gets.to_i
    thing = FileWriteRead.new(file_name, str, num)
    puts "do you want to write the file?\n"
    answer = gets.chomp
    if answer.upcase == "YES" || answer.upcase == "Y"
        thing.file_writer
        puts "wrote a file"
    else
        puts "OK"
    end
    puts "do you want to know how many lines are in that file?\n"
    answer = gets.chomp
    if answer.upcase == "YES" || answer.upcase == "Y"
        thing.file_line_counter
    else
        puts "OK"
    end
end

dialogue()