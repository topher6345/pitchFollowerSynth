task :test do
  puts `csound --syntax-check-only pitchTrackerSynth.csd`
end

task :open do
  puts `open pitchTrackerSynth.csd -a CsoundQt`
end

task default: %i(test)