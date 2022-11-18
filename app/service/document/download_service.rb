require 'csv'

module Document
  class DownloadService
    attr_reader :product

    def initialize(product)
      @product = product
    end

    def export_csv
      attributes = %w{nome email telefone celular cpf posicao genero}
      list = product.joins
      CSV.generate(headers: true) do |csv|
        csv << attributes
        list.each do |user|
          csv << attributes(user)
        end
      end
    end


    private


    def attributes(user)
      [user.name, user.email, user.phone, user.mobile, user.cpf, user.department, user.gender]
    end
  end
end