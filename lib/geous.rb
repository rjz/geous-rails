module Geous
  module Rails
    class Engine < ::Rails::Engine
      # Rails -> use vendor directory.
    end
  end

  # Keep this module unloadable while Geous remains under development
  unloadable

  # A map
  def self.static_map(opts)
   
    options = {
      :lat => 0,
      :lng => 0,
      :title => ''
    }.merge(opts)

    lat = URI.escape(options[:lat].to_s)
    lng = URI.escape(options[:lng].to_s)
    title = URI.escape(options[:title])

    url = "http://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{lng}&zoom=13&size=300x100&maptype=roadmap
  &markers=color:red%7C#{lat},#{lng}%7Clabel:#{title}&sensor=false"
    '<img src="' + url + '" />'
  end

  # Formtastic inputs
  def self.inputs(form, opts = {})

    options = {
      :lat => 0,
      :lng => 0,
      :title => ''
    }.merge(opts)

    resource = form.object

#    map = Geous::static_map :lat => resource.lat, :lng => resource.lng

    form.input :raw_address, :html => 'Address', :input_html => { :class => 'raw_address' } #, :hint => map.html_safe
    form.input :lat, :as => 'hidden', :value => options[:lat]
    form.input :lng, :as => 'hidden', :value => options[:lng]

  end

end
