##
##
## QWASAR.IO -- my_data_transform
##
##
## @param {String} csv_content
##
## @return {string[]}
##


def my_data_transform(csv_content)
    our_data = my_csv_parser(csv_content)

    row_number = our_data.length
    column_number = our_data[0].length

    email_index = our_data[0].index("Email")
    age_index = our_data[0].index("Age")
    order_at_index = our_data[0].index("Order At")

    row_index = 1
    column_index = 0

    while row_index < row_number

        email = our_data[row_index][email_index]
        email_array = email.split("@")
        provider = email_array[1]
        our_data[row_index][email_index] = provider

        #our_data[row_index][age_index] =
        #our_data[row_index][order_at_index] =
        
        row_index += 1
    end    


    return our_data
end


def my_csv_parser(my_string)
    array_rows = my_string.split("\n")
    array_columns = []
    array_rows.each do |row|
        array_columns << row.split(",")
    end
  
    return array_columns
   
end

array_2d = my_data_transform("Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At\nMale,Carl,Wilderman,carl,wilderman_carl@yahoo.com,29,Seattle,Safari iPhone,2,2020-03-06 16:37:56\nMale,Marvin,Lind,marvin,marvin_lind@hotmail.com,77,Detroit,Chrome Android,2,2020-03-02 13:55:51\nFemale,Shanelle,Marquardt,shanelle,marquardt.shanelle@hotmail.com,21,Las Vegas,Chrome,1,2020-03-05 17:53:05\nFemale,Lavonne,Romaguera,lavonne,romaguera.lavonne@yahoo.com,81,Seattle,Chrome,2,2020-03-04 10:33:53\nMale,Derick,McLaughlin,derick,mclaughlin.derick@hotmail.com,47,Chicago,Chrome Android,1,2020-03-05 15:19:48\n")

array_2d.each do |row|
    # iterate over each element in the row
    row.each do |element|
      print "#{element} "
    end
    # print a newline after each row
    puts
  end