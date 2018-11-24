class Priority < ApplicationRecord
  enum name: { A: 0, B: 1, C: 2 }
end
