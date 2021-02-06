class TestsController < ApplicationController
  layout 'admin_page_layout', only: [:criaroferta, 
              :review, :dashboard, :todasofertas, :editardados,
              :criarcupom, :todoscupons, :editarcupom, :editaroferta]

  # before_action :require_company, only: [:homeempresa]
  # before_action :restrict_access, only: [:cupons]

  def categorias
  end
  def cupons
  end
  def ofertas
  end
  def contato
  end
  def parceiros
  end
  def empresas
  end
  def empresa
  end
  def pesquisa
  end
  def ofertasdestaque
  end
  def hover
  end

  # empresas
  def homeempresa
  end

  def todasofertas
  end
  def todoscupons
  end
  def criaroferta
  end
  def criarcupom
  end
  def editaroferta
  end
  def editarcupom
  end
  
  def review
  end
  def dashboard
  end

  def editardados
  end

  # admin
  def setorempresas
  end
end
