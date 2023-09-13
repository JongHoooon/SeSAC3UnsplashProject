//
//  LottoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/13.
//

import Foundation

final class LottoViewModel {
    // MARK: - Input
    func viewDidLoad() {
        fetchLotto()
    }
    
    // MARK: - Output
    let number1 = Observable(1)
    let number2 = Observable(2)
    let number3 = Observable(3)
    let number4 = Observable(4)
    let number5 = Observable(5)
    let number6 = Observable(6)
    let number7 = Observable(7)
    let lottoMoneyText = Observable("0")
  
}

extension LottoViewModel {
    func fetchLotto() {
        guard let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=333") else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let lotto = try JSONDecoder().decode(Lotto.self, from: data)
                await MainActor.run {
                    number1.value = lotto.drwtNo1
                    number2.value = lotto.drwtNo2
                    number3.value = lotto.drwtNo3
                    number4.value = lotto.drwtNo4
                    number5.value = lotto.drwtNo5
                    number6.value = lotto.drwtNo6
                    number7.value = lotto.bnusNo
                    lottoMoneyText.value = format(for: lotto.totSellamnt)+"원"
                }
            } catch {
                print(error)
            }
        }
    }
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
}
