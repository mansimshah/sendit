namespace :my_namespace do

  desc "TODO"
  task count_attachments: :environment do
    @attachment_count = Transfer.all.pluck(:attachment).count
    puts "====Total Attachments=====",@attachment_count
  end

end