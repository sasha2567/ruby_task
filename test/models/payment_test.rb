require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test " should save new payment " do
  	email = User.all.first.email
  	payment = Payment.add_payment email
  	
  	assert_not_nil payment, " Payment не добавился "
	end

	test " should save new payment without user " do
  	email = 'test@test.com'
  	payment = Payment.add_payment email
  	assert_same payment, false, " Payment добавился при неверно заданом пользователе "
	end

	test " should test method get_last_payment " do
		payment = Payment.get_last_payment
		assert_instance_of Payment, payment, " Метод возвращает экземпляр класса, отличного от Payment "
	end

	test " should test method get_format_date_end " do
		current = Date.current
		last = Date.new(2016, 12, 4)
		date = Payment.get_format_date_end current
		assert_same last, date, " Даты не равны "
	end

	test " should delete payment " do
		payment = Payment.all.first
		Payment.delete_patment payment.id, payment.user.email
		check = Payment.find_by_id(payment.id)
		assert_nil check, " Payment не удалился "
	end


end
