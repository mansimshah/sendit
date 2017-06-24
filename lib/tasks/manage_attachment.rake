namespace :manage_attachment do

  desc "delete atatchment whose deleted_on date is reached"
  task delete_attachment: :environment do
    @attachments = Transfer.where('deleted_on < ?', Date.today)
    puts "====attachments===",@attachments.inspect
    puts "====attachments===count===",@attachments.count
    @attachments.destroy_all
    puts "===Attachment removed==="
  end

end