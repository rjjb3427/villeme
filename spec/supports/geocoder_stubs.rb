
address_from_albany = [{'address_components' =>[{'long_name' => '544', 'short_name' => '544', 'types' =>['street_number']}, {'long_name' => 'Madison Avenue', 'short_name' => 'Madison Ave', 'types' =>['route']}, {'long_name' => 'Park South', 'short_name' => 'Park South', 'types' =>['neighborhood', 'political']}, {'long_name' => 'Albany', 'short_name' => 'Albany', 'types' =>['locality', 'political']}, {'long_name' => 'Albany County', 'short_name' => 'Albany County', 'types' =>['administrative_area_level_2', 'political']}, {'long_name' => 'New York', 'short_name' => 'NY', 'types' =>['administrative_area_level_1', 'political']}, {'long_name' => 'United States', 'short_name' => 'US', 'types' =>['country', 'political']}, {'long_name' => '12208', 'short_name' => '12208', 'types' =>['postal_code']}, {'long_name' => '3614', 'short_name' => '3614', 'types' =>['postal_code_suffix']}], 'formatted_address' => '544 Madison Avenue, Albany, NY 12208, USA', 'geometry' =>{'location' =>{'lat' =>42.6544568, 'lng' =>-73.77161439999999}, 'location_type' => 'ROOFTOP', 'viewport' =>{'northeast' =>{'lat' =>42.6558057802915, 'lng' =>-73.77026541970848}, 'southwest' =>{'lat' =>42.6531078197085, 'lng' =>-73.7729633802915}}}, 'types' =>['street_address']}]
address_from_albany_pine_hills = [{"address_components"=>[{"long_name"=>"502", "short_name"=>"502", "types"=>["street_number"]}, {"long_name"=>"Washington Avenue", "short_name"=>"Washington Ave", "types"=>["route"]}, {"long_name"=>"Pine Hills", "short_name"=>"Pine Hills", "types"=>["neighborhood", "political"]}, {"long_name"=>"Albany", "short_name"=>"Albany", "types"=>["locality", "political"]}, {"long_name"=>"Albany County", "short_name"=>"Albany County", "types"=>["administrative_area_level_2", "political"]}, {"long_name"=>"New York", "short_name"=>"NY", "types"=>["administrative_area_level_1", "political"]}, {"long_name"=>"United States", "short_name"=>"US", "types"=>["country", "political"]}, {"long_name"=>"12203", "short_name"=>"12203", "types"=>["postal_code"]}, {"long_name"=>"1230", "short_name"=>"1230", "types"=>["postal_code_suffix"]}], "formatted_address"=>"502 Washington Avenue, Albany, NY 12203, USA", "geometry"=>{"location"=>{"lat"=>42.663087, "lng"=>-73.77475}, "location_type"=>"ROOFTOP", "viewport"=>{"northeast"=>{"lat"=>42.6644359802915, "lng"=>-73.77340101970849}, "southwest"=>{"lat"=>42.6617380197085, "lng"=>-73.7760989802915}}}, "place_id"=>"ChIJ9ZXOzksK3okR_pUEbA68khE", "types"=>["street_address"]}]
address_from_canoas = [{"address_components"=>[{"long_name"=>"456", "short_name"=>"456", "types"=>["street_number"]}, {"long_name"=>"Rua Carazinho", "short_name"=>"R. Carazinho", "types"=>["route"]}, {"long_name"=>"Mathias Velho", "short_name"=>"Mathias Velho", "types"=>["neighborhood", "political"]}, {"long_name"=>"Canoas", "short_name"=>"Canoas", "types"=>["locality", "political"]}, {"long_name"=>"Canoas", "short_name"=>"Canoas", "types"=>["administrative_area_level_2", "political"]}, {"long_name"=>"Rio Grande do Sul", "short_name"=>"RS", "types"=>["administrative_area_level_1", "political"]}, {"long_name"=>"Brazil", "short_name"=>"BR", "types"=>["country", "political"]}, {"long_name"=>"92330", "short_name"=>"92330", "types"=>["postal_code_prefix", "postal_code"]}], "formatted_address"=>"Rua Carazinho, 456 - Mathias Velho, Canoas - RS, Brazil", "geometry"=>{"bounds"=>{"northeast"=>{"lat"=>-29.9029312, "lng"=>-51.1959109}, "southwest"=>{"lat"=>-29.9029323, "lng"=>-51.1959293}}, "location"=>{"lat"=>-29.9029323, "lng"=>-51.1959109}, "location_type"=>"RANGE_INTERPOLATED", "viewport"=>{"northeast"=>{"lat"=>-29.9015827697085, "lng"=>-51.1945711197085}, "southwest"=>{"lat"=>-29.9042807302915, "lng"=>-51.1972690802915}}}, "types"=>["street_address"]}]
address_from_ip = [{"longitude"=>-51.2, "latitude"=>-30.0333, "asn"=>"AS18881", "offset"=>"-3", "ip"=>"177.18.147.47", "area_code"=>"0", "continent_code"=>"SA", "dma_code"=>"0", "city"=>"Porto Alegre", "timezone"=>"America/Sao_Paulo", "region"=>"Rio Grande do Sul", "country_code"=>"BR", "isp"=>"Global Village Telecom", "postal_code"=>"90110", "country"=>"Brazil", "country_code3"=>"BRA", "region_code"=>"23"}]

Geocoder.configure(lookup: :test)
Geocoder::Lookup::Test.add_stub('544 Madison Ave, Albany, NY 12208, USA', address_from_albany)
Geocoder::Lookup::Test.add_stub('502 Washington Avenue, Albany, NY 12203, USA', address_from_albany_pine_hills)
Geocoder::Lookup::Test.add_stub('Rua Carazinho, 456 - Canoas', address_from_canoas)
Geocoder::Lookup::Test.add_stub('177.18.147.47', address_from_ip)
Geocoder::Lookup::Test.set_default_stub(address_from_albany)

