class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def show
		@title = 'Application'
		@user = current_user[:email]
		@payments = Payment.all.page(params[:page]).per(10)
		@start = @payments.first.start_date
		@end = @payments.last.end_date
	end

  def add
		user = current_user[:email]
		render :json => {
			:result => Payment.add_payment(user), 
			:text => 'Форма успешно отправлена'
		}
	end

	def delete
		id = params[:id]
		render :json => {
			:result => (Payment.delete_patment(id, current_user[:email])).present?, 
			:text => 'Запись успешно удалена'
		}
	end
end
