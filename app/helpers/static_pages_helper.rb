module StaticPagesHelper
  def channel_list()
		var = ""
		Channel.all().each do |i|
			var = var + "<div> #{i.name} </div>"		
		end
		return var
	end
end

