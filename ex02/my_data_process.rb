##
##
## QWASAR.IO -- my_data_process
##
##
## @param {String[]} data_string
##
## @return {string}
##

require "json"

def my_data_process(data_string)
    our_data = data_string
    
    row_number = our_data.length
    data_array = []
    our_data.each do |row|
        data_array << row.split(",")
    end
    column_number = data_array[0].length
    data_hash = {}
    column_index = 0
    
    
    while column_index < column_number
        row_index = 1
        header = data_array[0][column_index]
        data_hash[header] = {}
        
        while row_index < row_number
            cell_value = data_array[row_index][column_index]
            if data_hash[header].has_key?(cell_value)
                data_hash[header][cell_value] += 1
            else  
                data_hash[header][cell_value] = 1
            end
            
            row_index+=1
    
        end
        column_index+=1
    end
  
    data_hash.delete("FirstName")
    data_hash.delete("LastName")
    data_hash.delete("UserName")
    data_hash.delete("Coffee Quantity")
  
    json_string = data_hash.to_json


    return json_string
end


#puts test = my_data_process(["Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At", "Male,Carl,Wilderman,carl,yahoo.com,21->40,Seattle,Safari iPhone,2,afternoon", "Male,Marvin,Lind,marvin,hotmail.com,66->99,Detroit,Chrome Android,2,afternoon", "Female,Shanelle,Marquardt,shanelle,hotmail.com,21->40,Las Vegas,Chrome,1,afternoon", "Female,Lavonne,Romaguera,lavonne,yahoo.com,66->99,Seattle,Chrome,2,morning", "Male,Derick,McLaughlin,derick,hotmail.com,41->65,Chicago,Chrome Android,1,afternoon"])

