def power(base:, exponent: 2)
    base**exponent
end

def clamp(value:, min:, max:) 
    if value < min 
        min
    elsif value > max
        max
    else   
        value
    end
end

def percentage(value:, total:, precision: 1) 
    (value.to_f / total).round(precision)
end

def report(label:, value:, unit: '') 
    puts "#{label}: #{value} #{unit}"
end

report(label: "power", value: power(base: 5))
report(label: "clamp", value: clamp(value:67, min:23, max:69))
report(label: "percentage", value: percentage(value:67, total:1000, precision: 3))
