require_relative "../calculadora"

describe Calculadora do

  subject do
    Calculadora.new
  end

  describe "#somar" do
    it "deveria somar dois números" do
      subject.somar(1, 2).should eql 3.0
    end

    it "deveria somar números negativos" do
      subject.somar(-1, -2).should eql -3.0
    end

    it "deveria somar com zero" do
      subject.somar(1, 0).should eql 1.0
      subject.somar(0, 1).should eql 1.0
    end

    context "quando os parâmetros não forem informados corretamente" do
      it "deveria lançar 'ParametrosInvalidosError'" do
        -> { subject.somar(1, "string") }.should raise_error ParametrosInvalidosError
        -> { subject.somar(nil, 1) }.should raise_error ParametrosInvalidosError
        
      end
    end
  end
  
  describe "#subtrair" do 
    it "deveria subtrair dois numeros" do
      subject.subtrair(3, 2).should eql 1.0
    end

    it "deveria subtrair dois números negativos" do
      subject.subtrair(-3, -3).should eql 0.0
    end 

    context "quando os parâmetros são inválidos" do
      it "deveria lançar um 'ParametrosInvalidosError'" do
        -> { subject.subtrair(" ", -3) }.should raise_error ParametrosInvalidosError
        -> { subject.subtrair(-3, nil) }.should raise_error ParametrosInvalidosError
      end
    end
  end

  describe "#multiplicar" do
    it "qualquer coisas multiplicado por zero é zero" do
      subject.multiplicar(2, 0).should eql 0.0
      subject.multiplicar(0, 3).should eql 0.0
    end

    it "deveria multiplicar dois números" do 
      subject.multiplicar(2, 3).should eql 6.0
    end

    it "deveria multiplicar dois números negativos" do
      subject.multiplicar(-1,-2).should eql 2.0
    end

    it "deveria multiplicar um número negativo e outro positivo" do
      subject.multiplicar(3,-2).should  eql -6.0
    end
    context "quando os parâmetros são inválidos." do
      it "deveria lançar um 'ParametrosInvalidosError'" do
        -> { subject.multiplicar(3, " a ")}.should raise_error ParametrosInvalidosError
        -> { subject.multiplicar(" a ", 3)}.should raise_error ParametrosInvalidosError
        -> { subject.multiplicar(nil, 3)}.should raise_error ParametrosInvalidosError
        
      end
    end
  end

 describe "#dividir" do
    it "deveira dividir dois números" do
      subject.dividir(4,2.0).should eql 2.0 
      subject.dividir(4,2).should eql 2.0
    end

    it "deveria dividir um número negativo e outro positvo" do
      subject.dividir(-4, -2).should eql 2.0
    end

    context "quando os parâmetros são inválidos." do
      it "deveria lançar um 'ZeroDivisionError'" do
        -> { subject.dividir(3, 0)}.should raise_error DivisaoPorZeroError
      end
      
      it "deveria lançar um 'ParametrosInvalidosError'" do
        -> { subject.dividir(nil, 3)}.should raise_error ParametrosInvalidosError  
        -> { subject.dividir(3, " ")}.should raise_error ParametrosInvalidosError  
      end
    end
  end 


  describe "#is_number?" do
    it  "deveria receber um inteiro" do
      1.is_number?.should eql true
    end

    it "deveria receber um número float" do
      1.0.is_number?.should eql true
    end

    it "deveria receber uma string que pode ser tranformada em um número" do
      " 2 ".is_number?.should eql true   
    end

    it "deveria receber uma string que não pode ser transformada em número" do
      " ".is_number?.should eql false
    end
  end

end