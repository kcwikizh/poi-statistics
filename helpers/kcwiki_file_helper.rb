require 'sinatra/base'
require 'digest'

module Sinatra
  module KcwikiFileHelper
    def kcwiki_get_file(filename, options = {})
      options = {protocol: ''}.merge(options)
      options[:protocol] += ':' unless options[:protocol].empty?

      hash = Digest::MD5.hexdigest(filename)
      "#{options[:protocol]}//kcwiki.misaka.cn/commons/#{hash[0]}/#{hash[0..1]}/#{filename}"
    end

    def kcwiki_get_thumb(filename, options = {})
      options = {protocol: '', size: 500}.merge(options)
      options[:protocol] += ':' unless options[:protocol].empty?

      hash = Digest::MD5.hexdigest(filename)
      "#{options[:protocol]}//kcwiki.misaka.cn/commons/thumb/#{hash[0]}/#{hash[0..1]}/#{filename}/#{options[:size]}px-#{filename}"
    end
  end

  helpers KcwikiFileHelper
end
