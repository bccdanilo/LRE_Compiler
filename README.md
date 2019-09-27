A LRE Frontend COMPILER, TO USE DOWNLOAD THE LLVM BACKEND USING THE FOLLOWING STEPS (PORTUGUESE/BR): 
Neste anexo serão detalhados os passos para a instalação do LLVM em um sistema
operacional Ubuntu, para a utilização do compilador LRE, proposto por esta pesquisa.
1. Criar uma pasta, em qualquer diretório, para armazenar os arquivos do LLVM
2. Criar uma pasta build e uma pasta LLVM.
3. Na pasta LLVM, utilizar o comando para a instalação do llvm: ’apt-get install LLVM’
4. Na pasta build, utilizar o seguinte comando:
cmake -G ’Unix Makefiles’ -DCMAKE_BUILD_TYPE=Release
-DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=AVR
../llvm
5. Na pasta build, utilizar o comando ’make -jN’, onde N é o número de núcleos virtuais
para executar o processo
6. Durante a execução, será solicitado a instalação de alguns outros programas, sendo
estes, o avrdude e o svn, os mesmos podem ser instalados da seguinte forma: ’apt-get
install gcc-avrdude’ e "apt-get install gcc-avr subversion"
O processo apresentado pode levar algumas horas para instalação. Apos completar
o procedimento, será possível utilizar o compilador LRE.
