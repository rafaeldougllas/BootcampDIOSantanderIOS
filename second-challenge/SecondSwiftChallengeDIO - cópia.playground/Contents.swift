import UIKit

enum OccupationArea {
    case exactSciences
    case humans
    case health
}

enum OccupationSalary {
    case aLotOfMoney
    case enough
    case subsistenceAllowance
}

class Employee {
    let name: String
    let area: OccupationArea
    let salary: OccupationSalary?
    
    init(name: String, area: OccupationArea, salary: OccupationSalary?) {
        self.name = name
        self.area = area
        self.salary = salary
    }
    
    func greetings() -> String {
        return getOccupationDescription() + getSalaryDescription() + "\n"
    }
    
    private func getOccupationDescription() -> String {
        switch area {
        case .exactSciences:
            return "Olá, eu sou \(name), gosto de cálculos"
        case .humans:
            return "Olá, eu sou \(name), meu forte não são números mas conheço bem da nossa história."
        case .health:
            return "Olá, eu sou \(name), minha paixão sempre foi a complexidade do corpo humano e como ele funciona."
        }
    }
    
    private func getSalaryDescription() -> String {
        guard let salary = salary else { return " Salário é bom mas eu exerço essa profissão como volutário e o meu pagamento é servir." }
        switch salary {
        case .aLotOfMoney:
            return " Não vou revelar meu salário mas o meu Audi está estacionado ali na frente."
        case .enough:
            return " Preciso de um aumento mas consigo sobreviver com o que ganho."
        case .subsistenceAllowance:
            return " Estou pagando para trabalhar ;/"
        }
    }
}

struct employmentAgency {
    let employees: [Employee]
    
    func greetings() {
        for employee in employees {
            print(employee.greetings())
        }
    }
}

let agency = employmentAgency(employees: [.init(name: "Médico",
                                                area: .health,
                                                salary: .aLotOfMoney),
                                          .init(name: "Professor",
                                                area: .humans,
                                                salary: .subsistenceAllowance),
                                          .init(name: "Desenvolvedor",
                                                area: .exactSciences,
                                                salary: .enough)])
agency.greetings()
