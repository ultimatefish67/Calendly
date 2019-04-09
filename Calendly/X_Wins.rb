require 'watir'

puts "Begin test: X Wins"

puts "Step 1: Open browser and go to game"
browser = Watir::Browser.new :firefox
browser.goto 'https://codepen.io/jshlfts32/full/bjambP/'

puts "Step 2: Enter size of tictactoe board"
browser.iframe(:id => 'result').text_field(:id => 'number').set '3'
browser.iframe(:id => 'result').button(:id =>'start').click

puts "Step 3: X and 0 player plays and X wins"
browser.iframe(:id => 'result').td(:id =>'4').click
browser.iframe(:id => 'result').td(:id =>'3').click
browser.iframe(:id => 'result').td(:id =>'0').click
browser.iframe(:id => 'result').td(:id =>'8').click
browser.iframe(:id => 'result').td(:id =>'2').click
browser.iframe(:id => 'result').td(:id =>'1').click
browser.iframe(:id => 'result').td(:id =>'6').click

puts "Expected Result:"
puts "A message should display 'Congradulations player X! You've won. Refresh to play again!'"

puts "Actual Result:"
if browser.iframe(:id => 'result').div(:id => 'endgame').text.include? "Congratulations player X!"
    puts " "
    puts "TEST PASSED."
    puts " "
    puts "Found: 'Congradulations player X! You've won. Refresh to play again!'"
else
    puts " "
    puts "******TEST FAILED.******"
    puts " "
    puts "Could not find: 'Congradulations player X! You've won. Refresh to play again!'"
end

puts "End test: X Wins"