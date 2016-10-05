class AppendXToYamlValues
  def parse_hash(hash)
    hash.each do |k,v|
      unless v.nil?
        puts 'changing: ' + k.to_s, 'Value: ' + v.to_s

        if(v.is_a?(Hash))
          hash[k] = parse_hash(v)
        else
          hash[k] = v.to_s + 'X' unless(v.is_a?(Array))
        end
      end
    end
  end
end

require 'yaml'

file = YAML.load_file('../dev/new_accountant_edition/host_app/config/locales/merge_en.yml')
a = AppendXToYamlValues.new
a.parse_hash file

File.open('../dev/new_accountant_edition/host_app/config/locales/merge_en.yml', 'w') {|f| f.write(file.to_yaml)}

