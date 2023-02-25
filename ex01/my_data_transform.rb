##
##
## QWASAR.IO -- my_data_transform
##
##
## @param {String} csv_content
##
## @return {string[]}
##

require 'date'

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
        our_data[row_index][email_index] = email_transformation(email)

        age = our_data[row_index][age_index]
        our_data[row_index][age_index] = age_transformation(age)
              
        order_time = our_data[row_index][order_at_index]
        our_data[row_index][order_at_index] = time_transformation(order_time)

        row_index += 1
    end
    
    data_string = []
    our_data.each do |row|
        data_string << row.join(",")
    end
 
    return data_string
end


def my_csv_parser(my_string)
    array_columns = []
    array_rows = my_string.split("\n")
    array_rows.each do |row|
        array_columns << row.split(",")
    end
    return array_columns
end

def email_transformation(email)
    provider = ""
    email_array = email.split("@")
    provider = email_array[1]
    return provider
end

def age_transformation(age)
    age_int = age.to_i
    case age_int
    when 1..20
        return "1->20"
    when 21..40
        return "21->40"
    when 41..65
        return "41->65"
    when 66..99
        return "66->99"
    end
    
end

def time_transformation(order_time)
    day_part = ""
    date_obj = DateTime.parse(order_time, '%Y-%m-%d %H:%M:%S')
    hour = date_obj.hour
    case hour
        when 6..11
        day_part = "morning"
        when 12..17
        day_part = "afternoon"
        when 18..23
        day_part = "evening"
    end
    return day_part
end


#my_data_transform("Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At\nMale,Carl,Wilderman,carl,wilderman_carl@yahoo.com,29,Seattle,Safari iPhone,2,2020-03-06 16:37:56\nMale,Marvin,Lind,marvin,marvin_lind@hotmail.com,77,Detroit,Chrome Android,2,2020-03-02 13:55:51\nFemale,Shanelle,Marquardt,shanelle,marquardt.shanelle@hotmail.com,21,Las Vegas,Chrome,1,2020-03-05 17:53:05\nFemale,Lavonne,Romaguera,lavonne,romaguera.lavonne@yahoo.com,81,Seattle,Chrome,2,2020-03-04 10:33:53\nMale,Derick,McLaughlin,derick,mclaughlin.derick@hotmail.com,47,Chicago,Chrome Android,1,2020-03-05 15:19:48\n")
