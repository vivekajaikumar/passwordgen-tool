#!/usr/bin/env ruby
require 'securerandom'
require 'optparse'

# Password generator and entropy calculator
class PasswordTool
  CHARACTER_SETS = {
    lowercase: 'abcdefghijklmnopqrstuvwxyz',
    uppercase: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
    numbers: '0123456789',
    symbols: '!@#$%^&*()-_=+[]{}|;:,.<>?/`~'
  }

  def self.generate(length = 12, use_sets = [:lowercase, :uppercase, :numbers, :symbols])
    chars = use_sets.map { |set| CHARACTER_SETS[set] }.join
    return "Invalid set" if chars.empty?

    password = Array.new(length) { chars[SecureRandom.random_number(chars.length)] }.join
    password
  end

  def self.entropy(password)
    charset_size = 0
    charset_size += 26 if password.match(/[a-z]/)
    charset_size += 26 if password.match(/[A-Z]/)
    charset_size += 10 if password.match(/[0-9]/)
    charset_size += CHARACTER_SETS[:symbols].size if password.match(/[^A-Za-z0-9]/)

    entropy = password.length * Math.log2(charset_size)
    entropy.round(2)
  end

  def self.strength(entropy)
    case entropy
    when 0..40
      "Weak 🔴"
    when 41..59
      "Moderate 🟡"
    else
      "Strong 🟢"
    end
  end
end

# CLI Interface
options = { length: 12, sets: [:lowercase, :uppercase, :numbers, :symbols] }

OptionParser.new do |opts|
  opts.banner = "Usage: ruby password_tool.rb [options]"

  opts.on("-lLENGTH", "--length=LENGTH", Integer, "Length of password") do |l|
    options[:length] = l
  end

  opts.on("--no-uppercase", "Exclude uppercase letters") do
    options[:sets].delete(:uppercase)
  end

  opts.on("--no-numbers", "Exclude numbers") do
    options[:sets].delete(:numbers)
  end

  opts.on("--no-symbols", "Exclude symbols") do
    options[:sets].delete(:symbols)
  end
end.parse!

password = PasswordTool.generate(options[:length], options[:sets])
entropy = PasswordTool.entropy(password)
strength = PasswordTool.strength(entropy)

puts "\n🔐 Generated Password: #{password}"
puts "🧮 Entropy: #{entropy} bits"
puts "💪 Strength: #{strength}"
