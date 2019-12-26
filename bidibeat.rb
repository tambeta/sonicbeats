i = 0

loop_sp = :loop_breakbeat
loop_len = sample_duration loop_sp

live_loop :beat do
  sample loop_sp
  sample :bd_808, amp: 4
  sleep loop_len
  i += 1
end

def ding(thing)
  if thing.is_a?(Symbol)
    sample thing
    return
  elsif thing.nil?
    return
  end
  
  with_fx :reverb do
    sample :elec_beep, rate: thing, amp: 0.8
  end
end

def play_dings(d1=nil, d2=nil, d3=nil, d4=nil)
  x = 0
  y = 0.5
  z = 0.1
  
  sleep x
  ding(d1)
  sleep y
  ding(d2)
  sleep z
  ding(d3)
  sleep z
  ding(d4)
  
  x + y + z*2
end

dings = [
  [1, 1, 0.95, 0.9],
  [1, 1, 0.95, 0.9].reverse,
  [1, 1, 0.95, 0.9],
  [1, 1, 0.95, 0.9].reverse,
  [0.5, 1, 1.2, 1],
  [0.5, 0.8, 1, 0.8],
  [0.5, 1, 1.2, 1],
  [0.5, 0.8, 1, 0.8],
  [],
  [:misc_crow, 1, :misc_crow, 1],
  [],
  [:misc_crow, 1, :misc_crow, 1],
  [],
]
n_dings = dings.size

live_loop :beeps do
  elapsed = play_dings(*(dings[i % n_dings]))
  sleep loop_len - elapsed
end
