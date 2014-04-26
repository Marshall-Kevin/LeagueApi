module LeagueApi

  class Champion
    @base_url = "nil"

    def self.make_base_url(modifier)
      options = LeagueApi.options
      @base_url = options[:base_url]+'/'+options[:region]+'/'+'v1.2/'+modifier+'?api_key='+options[:key]
      @base_url
    end

    def self.get_list
      make_base_url('champion')
      uri = URI.parse(@base_url)
      JSON.parse(uri.read)["champions"]
 	  end

    def self.get_by_id(id)
      make_base_url('champion/'+id.to_s)
      uri = URI.parse(@base_url)
      JSON.parse(uri.read)
    end
  
  end

end
