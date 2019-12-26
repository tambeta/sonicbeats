looplen = 1
i = 0

def main(i, rate)
  if i<=139
    sample :ambi_choir, rate: rate, release: 0.2
  end
  
  if i >= 8 && i <= 128
    sample :bd_haus, rate: 1, pan: 0.75
  end
end

live_loop :flibble do
  print "i = #{i}"
  main(i, i % 8 < 4 ? 0.3 : 0.2)
  
  if i >= 16 && i <=128 && i % 2 == 0
    sample :bd_boom, rate: 0.75, amp: 2, pan: -0.75
  end
  
  if i >= 24 && i <= 120 && i % 8 == 0
    sample :ambi_dark_woosh, pan: 0.33
    
    if i >= 40 && i <= 104
      sample :ambi_piano, pan: -0.33
    end
    
    if i >= 64 && i <= 100
      hrate = 0.2 - ((i - 64).to_f / 36 * 0.1)
      hpan = i % 16 == 0 ? -0.6 : 0.6
      print "hrate = #{hrate}, hpan = #{hpan}"
      sample :ambi_soft_buzz, amp: 2, rate: hrate, pan: hpan
    end
  end
  
  sleep looplen
  i += 1
end

