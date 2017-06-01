# Add #duration method to floats
module TestProf
  module FloatDuration
    refine Float do
      def duration
        t = self
        format("%02d:%02d.%03d", t / 60, t % 60, t.modulo(1) * 1000)
      end
    end
  end
end
  