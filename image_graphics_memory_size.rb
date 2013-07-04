require 'fastimage'


def get_size_in_kb (w, h)
	return ((w.to_f * h.to_f * 4) / 1024).to_f
end

def get_size_in_mb (w, h)
	return (((w.to_f * h.to_f * 4) / 1024) / 1024).to_f
end


def vram_in_kb( dir ) 
	kb = 0
	Dir.glob(dir + "*.{png,jpg,jpeg,gif}") do |item|
		dimensions = FastImage.size(item)
		kb = (kb + (get_size_in_kb dimensions[0], dimensions[1]))
	end
	return kb
end

def vram_in_mb( dir )
	mb = 0
	Dir.glob(dir + "*.{png,jpg,jpeg,gif}") do |item|
		dimensions = FastImage.size(item)
		mb = (mb + (get_size_in_mb dimensions[0], dimensions[1]))
	end
	return mb
end


puts vram_in_mb( "/Sky/skystoreyouview/asset/img/" ).to_s << "mb"