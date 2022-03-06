# Oystercard-app


## Instructions
- Fork this repo, and clone to your local machine
- Run the command gem install bundler (if you don't have bundler already)
- When the installation completes, run bundle

## How to use
```shell
cd oystercard-challenge

Run the tests:
rspec spec/
```

```shell
irb
3.0.0 :001 > require './lib/oystercard.rb'
 => true 
3.0.0 :002 > require './lib/station.rb'
 => true 
3.0.0 :003 > oystercard = Oystercard.new
 => #<Oystercard:0x0000000153182c30 @balance=0, @journeys=[],... 
 3.0.0 :004 > oystercard.touch_in('Bank')
 RuntimeError (The balance is insufficient. Minimum amount of £1 required.)

3.0.0 :005 > oystercard.top_up(55)
 => 55 
3.0.0 :006 > station = Station.new('Oxford St.', 1)
 => #<Station:0x0000000153244b50 @name="Oxford St.", @zone=1> 
3.0.0 :007 > oystercard.touch_in(station)
 => #<Station:0x0000000153244b50 @name="Oxford St.", @zone=1> 
3.0.0 :008 > oystercard.touch_out('Bank')
 => [{#<Station:0x0000000153244b50 @name="Oxford St.", @zone=1>=>"Bank"}] 
3.0.0 :009 > oystercard.journeys
 => [{#<Station:0x0000000153244b50 @name="Oxford St.", @zone=1>=>"Bank"}] 
```

### User stories

```shell
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don not want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it is complete

In order to pay for my journey
As a customer
I need to know where I have travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out
```

## Technologies

- Ruby
- Rubocop (source code analysis tool - linter)

## Credits

[Samuel Raducan](https://github.com/samuelmbp) [Maria Gromovaja](https://github.com/ruiined) [Nicola Cortese](https://github.com/NicolaCortese)
