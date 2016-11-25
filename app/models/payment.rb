class Payment < ActiveRecord::Base
paginates_per 50
	belongs_to :user

	@payment_days = [5, 20]

	def self.add_payment(user)
		last = Payment.get_last_payment
		payment = Payment.new
		payment.user = User.find_by_email(user)
		payment.created_at = Time.current
		payment.updated_at = Time.current
		if last.nil?
			payment.start_date = Date.current
		else
			payment.start_date = last.end_date + 1.day
		end
		payment.end_date = get_format_date_end(payment.start_date)
		return payment.save
	end

	def self.get_last_payment
		return Payment.all.order(:created_at).last
	end

	def self.get_format_date_end(date) 
		@payment_days.each do |day|
			if date.day < day
				result = Date.new(date.year, date.month, day-1)
				return result
			end
		end
		result = date + 1.month
		result = Date.new(result.year, result.month, @payment_days[0] - 1)
		return result
	end

	def self.delete_patment(id, userEmail)
		payment = Payment.find id
		if payment.user == User.find_by_email(userEmail)
			return payment.delete
		end
		return false
	end
end
