class CreateIntranetContribuicaoImportadas < ActiveRecord::Migration[6.1]
	def change
		create_table :intranet_contribuicao_importadas do |t|
		t.string :ano,          null: false
		t.string :serventia,    null: false
		t.string :descContrib,  null: false
		t.float  :float,        null: false
		t.string :documento,    null: false

		t.timestamps
		end
	end
end
