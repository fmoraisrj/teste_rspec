require 'ruby-debug'

class ParametrosInvalidosError < StandardError
end

class IsNotANumberError < StandardError
end

class DivisaoPorZeroError < StandardError
end

class Object
  def is_number? 
    #debugger
    self.to_f.to_s == self.to_s.delete(" ") || self.to_i.to_s == self.to_s.delete(" ")
  end
end

class Calculadora

	def somar a, b
    operacao_matematica a, b, :+
	end

  def subtrair a, b
    operacao_matematica a, b, :-  
  end

  def multiplicar a, b
    operacao_matematica a, b, :*
  end

  def dividir a, b
    operacao_matematica a, b, :/    
  end

  private
  def operacao_matematica a, b, operacao

    if !(a.is_number? || b.is_number) 
      puts IsNotANumberError.new
    end

    Float(a.send( operacao, b))

    rescue ZeroDivisionError
      raise DivisaoPorZeroError.new

    rescue StandardError => e
      raise ParametrosInvalidosError.new "#{a}:#{a.class} e #{b}:#{b.class} não são válidos | #{e.message}"
  end
  
  
end
