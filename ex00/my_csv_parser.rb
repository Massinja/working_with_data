##
##
## QWASAR.IO -- my_csv_parser
##
##
## @param {String} my_string
## @param {String} separator
##
## @return {string[][]}
##

def my_csv_parser(my_string, separator)
    array_rows = my_string.split("\n")
    array_columns = []
    array_rows.each do |row|
        array_columns << row.split(separator)
    end
  
    return array_columns
   
end
