require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

begin
    puts "What's your best friend's name?"
    name = gets.chomp
    puts "How long have you known this person?"
    yrs_known = convert_to_int(gets.chomp)
    raise "Please enter # of years known" if @yrs_known.nil?
    puts "What's your best friend's pastime?"
    fav_pastime = gets.chomp
    new_best_friend = BestFriend.new(name, yrs_known, fav_pastime)
rescue => e
    puts "Error: #{e}"
    retry
ensure
    p new_best_friend = BestFriend.new('', 6, '') if yrs_known < 5
end

# sam = BestFriend.new('', 1, '')

# sam.talk_about_friendship
# sam.do_friendstuff
# sam.give_friendship_bracelet

if $PROGRAM_NAME == __FILE__
    feed_me_a_fruit
end