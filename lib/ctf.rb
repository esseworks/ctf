require 'ctf/railtie' if defined?(Rails)
require 'yaml'

module Ctf

  class Comparer
    def self.compare(lang_file_1, lang_file_2)
      lang_1 = YAML::load(File.open lang_file_1)
      lang_2 = YAML::load(File.open lang_file_2)

      lang_1_key = lang_1.keys.first
      lang_2_key = lang_2.keys.first

      @keys = {}
      all_keys lang_1[lang_1_key]
      lang_1_keys = @keys
      @keys = {}
      all_keys lang_2[lang_2_key]
      lang_2_keys = @keys

      a_not_in_b = lang_1_keys.keys - lang_2_keys.keys
      b_not_in_a = lang_2_keys.keys - lang_1_keys.keys

      if a_not_in_b.empty? && b_not_in_a.empty?
        puts "============================"
        puts "Both files contain same keys"
        puts "============================"
      else
        puts "========================================================"
        puts "Keys exist in the first file, but not in the second one"
        puts "========================================================"
        a_not_in_b.each do |key|
          puts "#{key}: #{lang_1_keys[key]}"
        end
        puts "\n\n"
        puts "========================================================"
        puts "Keys exist in the second file, but not in the first one"
        puts "========================================================"
        b_not_in_a.each do |key|
          puts "#{key}: #{lang_2_keys[key]}"
        end
      end
    end

    def self.all_keys hash, parent = ""
      hash.each do |key, value|
        if value.is_a? Hash
          @keys.merge all_keys(value, [parent, key].select { |i| i unless i == "" }.join("."))
        else
          @keys[[parent, key].select { |i| i unless i == "" }.join(".")] = value
        end
      end
    end
  end

end
