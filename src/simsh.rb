require "socket"
require_relative "../lib/simsh/color.rb"

VER = 1.0
$usr = `whoami`.chomp.freeze
$hostname = Socket.gethostname.freeze
def prompt(texto)
  $prompt = -> { texto }
end
$exit_code_enabled = 0
simshrc = File.join("/etc/", "simshconfig.rb")

load simshrc if File.exist?(simshrc)

if ARGV[0] == "-v" || ARGV[0] == "--version"
		puts "simsh #{VER}"
		exit(0)
end

loop do
	begin
		print $prompt.call
		comando = gets&.chomp
		break if comando.nil?
		partes = comando.split
		break if comando == "exit"
		next if comando.empty?
		
		case partes[0]
			when "cd"
					if partes[1] == "~" || partes[1].nil?
						Dir.chdir(Dir.home)
						else
						begin
						Dir.chdir(partes[1])
						rescue Errno::ENOENT
						puts "simsh: diretório não encontrado: #{partes[1]}"
						rescue Errno::ENOTDIR
						puts "simsh: não é um diretório: #{partes[1]}"
				end
		end
		when "version"
			puts "simsh #{VER}"
		when "echo"
			if partes.any? { |parte| parte.start_with?("$") }
			partes.drop(1).each do |parte|
			if parte.start_with?("$")
				nome = parte[1..]
				print ENV[nome] || ""
			else
				print parte
			end
			print " "
		end
		puts
	else
		puts partes.drop(1).join(" ")
	end
		when "pwd"
			puts Dir.pwd()
		else
			system(comando)
			if $?.exitstatus == 127
				puts "comando não encontrado: #{partes[0]}"
			if $exit_code_enabled == 1
				puts "codigo de saida: #{$?.exitstatus}"
			end
			end
			end
	rescue Interrupt
		puts
	next
	end
end