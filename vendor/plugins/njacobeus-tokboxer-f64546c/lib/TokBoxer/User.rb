module TokBoxer

  class User

    attr_reader :jabberId, :secret
    alias       :id :jabberId

    def initialize(jabberId, secret, api)
      @jabberId = jabberId
      @secret = secret
      @api = api
      self.login
    end

    # TODO add a method which calls get_request_token from the API
    # to get the jabberId and secret from the email and password

    def login
      @api.login_user(self.jabberId,self.secret)
    end

    def create_call(full_name,persistent=false)
      result = @api.create_call(@jabberId, full_name, persistent)
      if result['createCall'] and (createCall=result['createCall'].first)
        Call.new createCall['callerName'],
                 createCall['callId'].first,
                 createCall['callerJabberId'],
                 createCall['persistent'],
                 createCall['server'].first,
                 @api
      else
        nil
      end
    end

    def access_token_valid?
      result = @api.validate_access_token(@jabberId, @secret)
      result['validateAccessToken'].first["isValid"].first == "true"
    end

    # Feeds ============================================================================================

    protected

    def build_vmails_array(what)
      xml = @api.get_feed(@jabberId,what)
      return [] unless xml["feed"].first["item"]
      xml["feed"].first["item"].map do |m|
        next unless m["videoMail"]
        VMail.new :id => m["videoMail"].first["vmailId"],
                  :message_id => m["videoMail"].first["content"]["messageId"].first
      end.compact
    end

    public

    def vmails
      build_vmails_array("all")
    end

    def sent_vmails
      build_vmails_array("vmailSent")
    end

    def received_vmails
      build_vmails_array("vmailRecv")
    end

    def recorder_embed_code(width="322", height="321",vmailToEmail="")
      <<-END
      <object width="#{width}" height="#{height}">
        <param name="movie" value="#{@api.api_server_url}#{API_SERVER_RECORDER_WIDGET}"></param>
        <param name="allowFullScreen" value="true"></param>
        <param name="allowScriptAccess" value="true"></param>
        <param name="FlashVars" value="tokboxPartnerKey=#{@api.api_key}&tokboxJid=#{jabberId}&tokboxAccessSecret=#{secret}&offsiteAuth=true&vmailToEmail=#{vmailToEmail}"></param>
        <embed id="tbx_recorder" src="#{@api.api_server_url}#{API_SERVER_RECORDER_WIDGET}"
          type="application/x-shockwave-flash"
          allowfullscreen="true"
          allowScriptAccess="always"
          width="#{width}"
          height="#{height}"
          FlashVars="tokboxPartnerKey=#{@api.api_key}&tokboxJid=#{jabberId}&tokboxAccessSecret=#{secret}&offsiteAuth=true&vmailToEmail=#{vmailToEmail}"
        >
        </embed>
      </object>
      END
    end

    def player_embed_code(messageId, width="425", height="344")
      <<-END
      <object type="application/x-shockwave-flash" data="#{@api.api_server_url}#{API_SERVER_PLAYER_WIDGET}#{messageId}" width="#{width}" height="#{height}">
                      <param name="movie" value="#{@api.api_server_url}#{API_SERVER_PLAYER_WIDGET}#{messageId}" />
                      <param name="FlashVars" value="tokboxPartnerKey=#{@api.api_key}&tokboxJid=#{jabberId}&tokboxAccessSecret=#{secret}" />
       </object>
      END
    end

    def is_online?
      info["isOnline"].first == "true"
    end

    def display_name
      info["displayName"].first
    end

    def username
      info["username"].first
    end

    def userid
      info["userid"].first
    end

    def show
      info["show"].first
    end

    protected

    def info
      @info ||= @api.get_user_profile(self.jabberId)["getUserProfile"].first
    end

  end

end