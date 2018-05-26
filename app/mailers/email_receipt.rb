class EmailReceipt < ActionMailer::Base

  def send_email(order)
    @order = Order.find(order.id)
    @line_items = @order.line_items
    string = ""
    @line_items.each do |i|
      string << i.product.name
    end

    puts "LINE ITEMS: " + string
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {:from    => ENV['MAILGUN_EMAIL'],
                      :to      => 'andreaafinlay@gmail.com',
                      :subject => "Jungle - Order Confirmation - Order # #{order.id}",
                      :html    => "<HTML><head></head><body><p>Your order has been successfully placed. Items Purchased: #{string} Total Cost: #{order.total_cents}</p></body></HTML>"}
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
    puts "******* SENT THE EMAIL *********"
  end
end
