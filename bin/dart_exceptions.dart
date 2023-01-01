import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 704);

    // Observando resultado
    if (result) {
      print("transação concluída com sucesso!");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O id ${e.idSender} do remetente não é um id válido!");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O id ${e.idReceiver} do destinatário não é um id válido!");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O id remetente ${e.idSender} não está autenticado!");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print(
        "O usuário de id ${e.idSender} tentou enviar ${e.amount} sendo que seu saldo é de ${e.senderBalance}");
  } on Exception {
    print("Algo deu errado!");
  }
}

// void main() {
//   print("Started Main");
//   functionOne();
//   print("Finished Main");
// }

// void functionOne() {
//   print("Started F01");
//   functionTwo();
//   print("Finished F01");
// }

// void functionTwo() {
//   print("Started F02");
//   for (int i = 1; i <= 5; i++) {
//     print(i);
//   }
//   print("Finished F02");
// }
