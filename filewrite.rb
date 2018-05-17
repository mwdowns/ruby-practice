file_name = "./sample.txt"
file_handle = File.open(file_name, 'w')
file_handle << "yo, dude!"
file_handle.close