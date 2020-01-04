# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
#
# validate_ldap_sub_dn.rb
#

# ---- original file header ----
#
# @summary
#   
#
Puppet::Functions.create_function(:'bodgitlib::validate_ldap_sub_dn') do
  # @param arguments
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :arguments
  end


  def default_impl(*arguments)
    

    raise Puppet::ParseError, 'validate_ldap_sub_dn(): Wrong number of ' +
      "arguments given (#{arguments.size} for 2)" if arguments.size != 2

    base = arguments[0]
    item = arguments[1]

    function_validate_ldap_dn([base])

    unless item.is_a?(Array)
      item = [item]
    end

    if item.size == 0
      raise Puppet::ParseError, 'validate_ldap_sub_dn(): Requires an array ' +
        'with at least 1 element'
    end

    item.each do |i|
      unless i.is_a?(String)
        raise Puppet::ParseError, 'validate_ldap_sub_dn(): Requires either ' +
          'an array or string to work with'
      end

      begin
        function_validate_ldap_dn([i])
        # Crude, but it should work
        raise unless i =~ /(?:^|,)#{Regexp.escape(base)}$/
      rescue
        raise Puppet::ParseError, 'validate_ldap_sub_dn(): ' +
          "#{i.inspect} is not a valid LDAP subtree distinguished name"
      end
    end
  
  end
end
