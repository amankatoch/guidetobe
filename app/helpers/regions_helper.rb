module RegionsHelper

  def region_marker(region)
    content_tag :div, class: "map_marker #{region.name.downcase}" do
      link_to region.name, region_path(region), id: "#{region.name.downcase}_position"
    end
  end

  def region_welcome_message(region)
    "Welcome to Guide To Be, #{region.name}"
  end

  def region_cities_message(region)
  	if region.name=="East of England"
    	"This includes Cambridge, Chelmsford, Colchester, Ipswich, Luton, Norwich, Peterborough, and Southend-on-Sea."
    elsif region.name=="East Midlands"
      "This includes Derby, Leicester, Northampton, and Nottingham."
    elsif region.name=="London & South East"
      "This includes Brighton, London, Maidstone, Oxford, Portsmouth, Reading, Slough, Southampton, and Wycombe."
	  elsif region.name=="North East"
      "This includes Middlesbrough, Newcastle, and Sunderland."
    elsif region.name=="North West"
      "This includes Blackburn, Blackpool, Bolton, Liverpool, Manchester, Preston, and Warrington."
    elsif region.name=="Scotland"
      "This includes Aberdeen, Dundee, Edinburgh, Glasgow, and Paisley."
    elsif region.name=="South West"
      "This includes Bristol, Bournemouth, Cheltnam, Exeter, Gloucester, Plymouth, Poole, and Swindon."
    elsif region.name=="Wales"
      "This includes Cardiff, Newport, and Swansea."
    elsif region.name=="West Midlands"
      "This includes Birmingham, Coventry, Dudley, Solihull, Stoke on Trent, and Wolverhampton."
    elsif region.name=="Yorkshire"
      "This includes Bradford, Doncaster, Huddersfield, Hull, Leeds, Rotherham, Sheffiled, and York."
    elsif region.name=="Northern Ireland"
      "This includes Bangor, Belfast, Derry, and Lisburn."
  end  
  end

end
