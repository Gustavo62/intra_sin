require 'csv'
namespace :csv_tabeliao do
	desc "Importa o arquivo tabeliao_db.csv"
	task import: :environment do
		CSV.foreach('tmp/tabeliao_db.csv', col_sep: ';').with_index do |linha, indice|
			unless (indice == 0)
				if linha[3] == 1 or   linha[3] == '1'
					@wpp = true
				else
					@wpp = true
				end
				Intranet::Tabeliao.create!(id: linha[0], nome: linha[1], telefone: linha[2], whatsapp:linha[3], email:linha[4], cpf:linha[5])
			end
		end
	end
end
