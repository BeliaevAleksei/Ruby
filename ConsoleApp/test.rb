type = {'1' => 'Аpartment', '2' => 'Electricity', '3' => 'Phone'}
payment = {'имя' => 'string', 'фамилия' => 'string', 'отчество' => 'string', 'сумма платежа' => 'integer',
            'внесенная сумма оплаты' => 'integer', '#{type[0]}' => 'type[1]'}
for i in payment
      puts i[0]
  end
  puts type.size